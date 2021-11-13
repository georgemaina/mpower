//@dart=2.9
import 'package:flutter/material.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/controllers/MenuController.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mpower/main.dart';
import 'package:mpower/screens/main_screen.dart';
import 'package:mpower/screens/register.dart';
import 'globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard.dart';
import 'final_screen.dart';

class Defaulters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: secondaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Text('List of Defaulters'),
            // automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => myMain()));
              },
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => Register()));
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
        body: MainListView(),
      ),
    );
  }
}

class Client {
  int ID;
  String names;
  String age;
  String sex;
  String serviceDefaulted;
  String village;
  String guardian;
  // int contacts;
  String chvName;
  String contacted;

  Client({
    this.ID,
    this.names,
    this.age,
    this.sex,
    this.serviceDefaulted,
    this.village,
    this.guardian,
    // this.contacts,
    this.chvName,
    this.contacted,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      ID: json["ID"],
      names: json["names"],
      age: json["age"],
      sex: json["sex"],
      serviceDefaulted: json["serviceDefaulted"],
      village: json["village"],
      guardian: json["guardian"],
      // contacts: json["contacts"],
      chvName: json["chvName"],
      contacted: json['contacted'],
    );
  }
}

class MainListView extends StatefulWidget {
  @override
  _MainListViewState createState() => _MainListViewState();
}

class _MainListViewState extends State {
  final String apiURL =globals.url.toString() + 'getDefaulterList';

  Future<List<Client>> fetchClients() async {
    // print(apiURL);
    var response = await http.get(Uri.parse(apiURL));
    // print(response.statusCode);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Client> clientList = items.map<Client>((json) {
        return Client.fromJson(json);
      }).toList();

      return clientList;
    } else {
      throw Exception('Failed to load data from Server.');
    }
  }

  navigateToNextActivity(BuildContext context, int dataHolder) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SecondScreenState(dataHolder.toString())));
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Client>>(

      future: fetchClients(),
      builder: (context, snapshot) {

        // print(snapshot.hasData);

        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());


        // print(snapshot.data.names.length);
        // print(snapshot.hasData);
        return ListView(
          children: snapshot.data
              .map((data) => Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          navigateToNextActivity(context, data.ID);
                        },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // if (Responsive.isDesktop(context))
                                //   Expanded(
                                //     // default flex = 1
                                //     // and it takes 1/6 part of the screen
                                //     child: SideMenu(),
                                //   ),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 0, 5),

                                    child: Text(
                                        '${data.ID}  ${data.names}',
                                        style: TextStyle(fontSize: 16),
                                        textAlign: TextAlign.left)),
                                Expanded(
                                    child:Padding(
                                      padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                                      child: Text(
                                        ' - Service Defaulted ${data.serviceDefaulted}',
                                        style: TextStyle(fontSize: 16,color:Colors.yellow),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                ),

                              ]),

                      ),
                      Divider(color: Colors.black),
                    ],
                  ))
              .toList(),

        );

      },
    );
  }
}


class SecondScreenState extends StatefulWidget {
  final String idHolder;

  const SecondScreenState(this.idHolder);

  @override
  State<StatefulWidget> createState() {
    return SecondScreen(this.idHolder);
  }
}

class SecondScreen extends State<SecondScreenState> {
  final String idHolder;
  TextEditingController reasonNotContacted = TextEditingController();
  TextEditingController isDefaulter = TextEditingController();
  TextEditingController serviceLocation = TextEditingController();
  TextEditingController serviceDate = TextEditingController();
  TextEditingController referTo = TextEditingController();
  TextEditingController dateContacted = TextEditingController();

  final String apiURL =globals.url.toString() + 'getDefaulter';
  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;
  final formKey =new GlobalKey<FormState>();

  bool defaultedVisible = false ;
  bool reasonNotContactedVisible = false ;
  bool serviceReceivedVisible = false ;
  bool referToVisible = false ;

  void showWidget(){
    setState(() {
      defaultedVisible = true ;
      reasonNotContactedVisible=false;
    });
  }

  void hideWidget(){
    setState(() {
      defaultedVisible = false;
      reasonNotContactedVisible=true;
    });
  }

  void showWidget2(){
    setState(() {
      serviceReceivedVisible=true;
      referToVisible=false;
    });
  }

  void hideWidget2(){
    setState(() {
      serviceReceivedVisible=false;
      referToVisible=true;
    });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;
      switch (_radioValue1) {
        case 0:
          correctScore++;
          print(_radioValue1);
          this.showWidget();
          break;
        case 1:
          print(_radioValue1);
          this.hideWidget();
          break;
      }
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;
      switch (_radioValue2) {
        case 2:
          correctScore++;
          this.hideWidget2();
          print(_radioValue2);
          break;
        case 3:
          this.showWidget2();
          print(_radioValue2);
      }
    });
  }

  SecondScreen(this.idHolder);

  Future<List<Client>> fetchClient() async {
    var data = {'ID': int.parse(idHolder)};

    var response = await http.post(Uri.parse(apiURL), body: json.encode(data));

    if (response.statusCode == 200) {
      // print(response.statusCode);

      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Client> clientList = items.map<Client>((json) {
        return Client.fromJson(json);
      }).toList();

      return clientList;
    } else {
      throw Exception('Failed to load data from Server.');
    }
  }

  submit(){
    // First validate form.
    var form = formKey.currentState;
    if (form.validate()) {
      // form.save();
      // setState(() {
      //   _myActivityResult = _myActivity;
      // });

      this.updateRegister();

      // print('Printing the login data.');
      // print('Mobile: ${_data.username}');
      // print('Password: ${_data.password}');

    }
  }

  Future updateRegister() async {
    String url = globals.url.toString() +"updateDefaulter";
    var response = await http.post(Uri.parse(url), body: {
      "reasonNotContacted": reasonNotContacted.text,
      "isDefaulter": isDefaulter.text,
      "serviceLocation": serviceLocation.text,
      "serviceDate": serviceDate.text,
      "referTo": referTo.text,
      "dateContacted": dateContacted.text,
      "ID":idHolder,
    });

    print(response.body);
    var data=jsonDecode(response.body);

    if(data=="Error"){
      // Scaffold.of(context).showSnackBar(SnackBar(
      print('Could not save Defaulter');
      // ));
    }else{
      print('Successfully saved defaulter');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>myMain()));
    }
  }

  Widget build(BuildContext context) {
    TextEditingController Reason = new TextEditingController();
    TextEditingController serviceDate = new TextEditingController();

    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: secondaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: Scaffold(
            appBar: AppBar(
                title: Text('Showing Defaulter Details'),
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  // onPressed: () => Navigator.pop(context, false),
                    onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>Defaulters())),
                )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Register()));
              },
              child: const Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
            body: FutureBuilder<List<Client>>(
              future: fetchClient(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());

                return ListView(
                  children: snapshot.data
                      .map((data) => Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  print(data.names);
                                },
                                child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                      Text('ID = ' + data.ID.toString(),
                                              style: TextStyle(fontSize: 16)),
                                      Text('Name = ' + data.names,
                                              style: TextStyle(fontSize: 16)),
                                      // Text('Phone Number = ' +data.contacts,style: TextStyle(fontSize: 21))),
                                      Text('Service Defaulted = ' +data.serviceDefaulted,style: TextStyle(fontSize: 16)),
                                      Text('Village = ' + data.village,style: TextStyle(fontSize: 16)),
                                      Text('Guardian = ' + data.guardian,style: TextStyle(fontSize: 16)),
                                      Text('CHV Name = ' + data.chvName,style: TextStyle(fontSize: 16)),
                                      SizedBox(height: 10.0),
                                      Text('Has the Patient been Contacted',
                                              style: TextStyle(fontSize: 18,
                                              color: Color.fromARGB(200, 200, 300, 300),
                                              fontWeight:FontWeight.bold)),
                                      Form(
                                      key:formKey,
                                          child: Column(
                                          children:[
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: <Widget>[
                                                  new Radio(
                                                    value: 0,
                                                    groupValue: _radioValue1,
                                                    onChanged:
                                                    _handleRadioValueChange1,
                                                  ),
                                                  new Text('Yes',style: new TextStyle(fontSize: 16.0),),
                                                  new Radio(
                                                    value: 1,
                                                    groupValue: _radioValue1,
                                                    onChanged:
                                                    _handleRadioValueChange1,
                                                  ),
                                                  new Text('No',style: new TextStyle(fontSize: 16.0),
                                                  ),
                                                ],
                                              ),
                                            Visibility(
                                                maintainAnimation: true,
                                                maintainState: true,
                                                visible: defaultedVisible,
                                                child: Column(
                                                    crossAxisAlignment:CrossAxisAlignment.start,
                                                  children:[
                                                    Text('Has the Patient defaulted',
                                                        style: TextStyle(
                                                            fontSize: 21,
                                                            color: Color.fromARGB(200, 200, 300, 300),
                                                            fontWeight:
                                                            FontWeight.bold)),
                                                    Row(
                                                      mainAxisAlignment:MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        new Radio(value: 2,groupValue: _radioValue2,onChanged:_handleRadioValueChange2),
                                                        new Text('Yes',style: new TextStyle(fontSize: 16.0)),
                                                        new Radio(value: 3,groupValue: _radioValue2,onChanged:_handleRadioValueChange2),
                                                        new Text('No',style: new TextStyle(fontSize: 16.0)),
                                                      ],
                                                    ),
                                                  ]

                                                )),
                                            Visibility(
                                                maintainAnimation: true,
                                                maintainState: true,
                                                visible: reasonNotContactedVisible,
                                                child:TextFormField(
                                                    controller: reasonNotContacted,
                                                    decoration: InputDecoration(
                                                      hintText: 'Reason not Contacted',
                                                      // suffixIcon: Icon(Icons.email),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                    ),
                                                  ),
                                         ),
                                            Visibility(
                                              maintainAnimation: true,
                                              maintainState: true,
                                              visible: serviceReceivedVisible,
                                              child:Column(
                                                children: [
                                                  TextFormField(
                                                    controller: serviceLocation,
                                                    decoration: InputDecoration(
                                                      hintText: 'Facility patient received service',
                                                      // suffixIcon: Icon(Icons.email),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  TextFormField(
                                                    controller: serviceDate,
                                                    decoration: InputDecoration(
                                                      hintText: 'Date received service',
                                                      // suffixIcon: Icon(Icons.email),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Visibility(
                                              maintainAnimation: true,
                                              maintainState: true,
                                              visible: referToVisible,
                                                  child:TextFormField(
                                                    controller: referTo,
                                                    decoration: InputDecoration(
                                                      hintText: 'Refer patient to Facility',
                                                      // suffixIcon: Icon(Icons.email),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                    ),
                                                  ),

                                            ),
                                            SizedBox(height: 30.0),
                                            Container(
                                              child:ElevatedButton(
                                                child: Text('Save'),
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.indigo,
                                                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                                    textStyle: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white
                                                    )),
                                                onPressed: (){
                                                  this.submit();

                                                },
                                              ),
                                            )
                                      ])),
                              ]))]))
                      .toList(),
                );
              },
            ),
        ));
  }
}


