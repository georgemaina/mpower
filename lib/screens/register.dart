import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mpower/screens/defaulters.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:validate/validate.dart';
import 'globals.dart' as globals;
import 'package:provider/provider.dart';
import 'package:mpower/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/models/counties.dart';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
   const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _myActivity="";
  String _myActivityResult="";
  TextEditingController names = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController sex = TextEditingController();
  // DropDownFormField serviceDefaulted = DropDownFormField();
  TextEditingController village = TextEditingController();
  TextEditingController guardian = TextEditingController();
  TextEditingController contacts = TextEditingController();
  TextEditingController chvName = TextEditingController();


  final formKey =new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  Future registerDefaulter()async {
    String url = globals.url.toString() + "registerDefaulter";
    var response = await http.post(Uri.parse(url), body: {
      "names": names.text,
      "age": age.text,
      "sex": sex.text,
      "serviceDefaulted": _myActivityResult,
      "village": village.text,
      "guardian": guardian.text,
      "contacts": contacts.text,
      "chvName": chvName.text,
    });

    var data=jsonDecode(response.body);
    if(data=="Error"){
      // Scaffold.of(context).showSnackBar(SnackBar(
        print('Could not save Defaulter');
      // ));
    }else{
      print('Successfully saved defaulter');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Defaulters()));
    }
  }

  submit(){
    // First validate form.
    var form = formKey.currentState;
  // if (form.validate()) {
     // form.save();
     setState(() {
       _myActivityResult = _myActivity;
     });

      this.registerDefaulter();

      // print('Printing the login data.');
      // print('Mobile: ${_data.username}');
      // print('Password: ${_data.password}');

    //}
  }

 // @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    Future<List<CountyModel>> getData(filter) async {
      String url = globals.url.toString() + "getCounties";
      var response = await Dio().get(
        url,
        queryParameters: {"filter": filter},
      );

      final data = response.data;
      if (data != null) {
        return CountyModel.fromJsonList(data);
      }

      return [];
    }
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: secondaryColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
     home:Scaffold(
      appBar: AppBar(
        title: Text('CHF Register'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
      ),
      body: Container(
        height: height,
        width: width,
          child:Form(
            key:formKey,

            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('CHF Registration',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  TextFormField(
                    controller: names,
                    decoration: InputDecoration(
                      hintText: 'Names of CHF',
                      // suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter CHF Names';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    obscureText: false,
                    controller: age,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      // suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter CHF phone Number';
                        }
                        return null;
                  },
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    obscureText: false,
                    controller: sex,
                    decoration: InputDecoration(
                      hintText: 'Name of Health Facility',
                      // suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Facility Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0,),
                    DropdownSearch<CountyModel>(
                      items: [
                        CountyModel(county: "Offline name1", id: "999"),
                        CountyModel(county: "Offline name2", id: "0101")
                      ],
                      maxHeight: 300,
                      onFind: (String? filter) => getData(filter),
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Choose your County",
                        contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: print,
                      showSearchBox: true,
                    ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    obscureText: false,
                    controller: guardian,
                    decoration: InputDecoration(
                      hintText: 'Sub County',
                      // suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Sub-Counter';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    obscureText: false,
                    controller: contacts,
                    decoration: InputDecoration(
                      hintText: 'Facility MFL Code',
                      // suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Facility MFL Code';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    obscureText: false,
                    controller: chvName,
                    decoration: InputDecoration(
                      hintText: 'Venue of Awareness Creation',
                      // suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please CHVs Names';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownSearch(
                    items: ["Church","Chief Baraza","Women’s Group","Men’s Group","Market","Other"],
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Type of Gathering/Group",
                      labelText: "Type of Gathering/Group",
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: print,
                    // selectedItem: "Tunisia",
                    // validator: (String item) {
                    //   if (item == null)
                    //     return "Required field";
                    //   else if (item == "Brazil")
                    //     return "Invalid item";
                    //   else
                    //     return null;
                    // },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       // Text('Forget password?',style: TextStyle(fontSize: 12.0),),
                        ElevatedButton(
                          child: Text('REGISTER'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                )),
                          onPressed: (){
                            print(names.text);
                            print(chvName.text);
                            this.submit();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:20.0),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(_myActivityResult),
              )
                ],
              ),
            ),
          ),
      ),
     ),
    );
  }
  }

