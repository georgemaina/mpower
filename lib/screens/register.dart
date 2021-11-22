import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:mpower/models/counties.dart';
import 'package:mpower/screens/Awareness.dart';
import 'package:mpower/screens/defaulters.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
// import 'package:validate/validate.dart';
import 'globals.dart' as globals;
// import 'package:provider/provider.dart';
import 'package:mpower/constants.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:dio/dio.dart';
import 'package:mpower/database.dart';
// import 'package:mpower/screens/views/health_workers.dart';

class Register extends StatefulWidget {
   const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _myActivity="";
  String _myActivityResult="";

  late List<DropdownMenuItem<String>> list;

  TextEditingController names = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController facility = TextEditingController();
  TextEditingController county = TextEditingController();
  TextEditingController subcounty = TextEditingController();
  TextEditingController mflcode = TextEditingController();
  TextEditingController venue = TextEditingController();
  TextEditingController gathering = TextEditingController();
  TextEditingController menreached = TextEditingController();
  TextEditingController womenreached = TextEditingController();
  TextEditingController disabledreached = TextEditingController();
  TextEditingController inputdate = TextEditingController();

  final formKey =new GlobalKey<FormState>();

   @override
  void initState() {
    super.initState();
    list=[];
    DBProvider.getCounties().then((listMap) {
      listMap.map((map){
        print(map.toString());
        return getDropDownWidget(map);
      }).forEach((dropDownItem) {
        list.add(dropDownItem);
      });
      setState(() {});
    });


    _myActivity = '';
    _myActivityResult = '';
  }

  DropdownMenuItem<String> getDropDownWidget(Map<String, dynamic> map){
    return DropdownMenuItem<String>(
      value:map['county'],
      child:Text(map['county']),

    );
    }



    Future registerDefaulter()async {
    String url = globals.url.toString() + "registerchw";
    var response = await http.post(Uri.parse(url), body: {
      "names": names.text,
      "phone": phone.text,
      "facility": facility.text,
      "county": county.text,
      "subcounty": subcounty.text,
      "mflcode": mflcode.text,
      "venue": venue.text,
      "gathering": gathering.text,
      "menreached": menreached.text,
      "womenreached": womenreached.text,
      "disabledreached": disabledreached.text,
      "inputdate": inputdate.text,
    });

    var data=jsonDecode(response.body);
    if(data=="Error"){
      // Scaffold.of(context).showSnackBar(SnackBar(
        print('Could not Add Health Worker');
      // ));
    }else{
      print('Successfully Added Healthworker');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Defaulters()));
    }
  }

  submit() async{
    // First validate form.
    // var form = formKey.currentState;
   // if (form.validate()) {
     // form.save();
     setState(() {
       _myActivityResult = _myActivity;
     });

    DBProvider.createWorker(names.text, phone.text, facility.text, county.text,
        subcounty.text, mflcode.text, venue.text,gathering.text, menreached.text,
        womenreached.text, disabledreached.text,inputdate.text);
      //this.registerDefaulter();
     Navigator.push(
         context,
         MaterialPageRoute(builder: (context)=>AwarenessApp())
     );

      // print('Printing the login data.');
      // print('Mobile: ${_data.username}');
      // print('Password: ${_data.password}');

    // }
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

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
                    controller: phone,
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
                    controller: facility,
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
                  SizedBox(height: 10.0,),
                  TextFormField(
                    obscureText: false,
                    controller: county,
                    decoration: InputDecoration(
                      hintText: 'County',
                      // suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter County';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    obscureText: false,
                    controller: subcounty,
                    decoration: InputDecoration(
                      hintText: 'Sub County',
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
                  //   DropdownButton(
                  //
                  //       hint: Text('Select County'),
                  //       onChanged:(value){},
                  //       items: list,
                  //     borderRadius: BorderRadius.circular(10.0),
                  //   ),
                  // SizedBox(height: 20.0,),
                  TextFormField(
                    obscureText: false,
                    controller: mflcode,
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
                    controller: venue,
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
                  ),
                  TextFormField(
                    obscureText: false,
                    controller: menreached,
                    decoration: InputDecoration(
                      hintText: 'Men Reached',
                      // suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Number of Men Reached';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: false,
                    controller: womenreached,
                    decoration: InputDecoration(
                      hintText: 'Number Women Reached',
                      // suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Number of women Reached';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: false,
                    controller: disabledreached,
                    decoration: InputDecoration(
                      hintText: 'Disabled Reached',
                      // suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Number of Disabled Reached';
                      }
                      return null;
                    },
                  ),TextFormField(
                    obscureText: false,
                    controller: inputdate,
                    decoration: InputDecoration(
                      hintText: 'Input date',
                      // suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Number of Disabled Reached';
                      }
                      return null;
                    },
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
                            print(facility.text);
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

