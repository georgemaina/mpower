import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpower/models/facilities.dart';
import 'package:mpower/screens/Awareness.dart';
import 'package:mpower/screens/defaulters.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
// import 'package:validate/validate.dart';
import 'globals.dart' as globals;
// import 'package:provider/provider.dart';
import 'package:mpower/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:mpower/database.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
   const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _myActivity = "";
  String _myActivityResult = "";

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
  final formKey = new GlobalKey<FormState>();

  var countyname = "";
  var subcountyname;
  var message;
  bool error = false;
  var countydata;

  List<String> counties = [
    "Mombasa",
    "Kwale",
    "Kilifi",
    "Tana River",
    "Lamu",
    "Taita-Taveta",
    "Garissa",
    "wajir",
    "Mandera",
    "Marsabit",
    "Isiolo",
    "Meru",
    "Tharaka-Nithi",
    "Embu",
    "Kitui",
    "Machakos",
    "Makueni",
    "Nyandarua",
    "Nyeri",
    "Kirinyaga",
    "Murang'a",
    "Kiambu",
    "Turkana",
    "West Pokot",
    "Samburu",
    "Trans Nzoia",
    "Uasin Gishu",
    "Elgeyo-Marakwet",
    "Nandi",
    "Baringo",
    "Laikipia",
    "Nakuru",
    "Narok",
    "Kajiado",
    "Kericho",
    "Bomet",
    "Kakamega",
    "Vihiga",
    "Bungoma",
    "Busia",
    "Siaya",
    "Kisumu",
    "Homa Bay",
    "Migori",
    "Kisii",
    "Nyamira",
    "Nairobi City"
  ];

  String dataurl = globals.url.toString() + "getSubCounties";

  @override
  void initState() {
    // TODO: implement initState
    error = false;
    message = "";
    countyname = "Kiambu"; //default country
    super.initState();
  }

  Future<void> getSubCounty() async {
    var res = await http.post(
        Uri.parse(dataurl + "&county=" + Uri.encodeComponent(countyname)));
    //attache countryname on parameter country in url
    print(dataurl);
    if (res.statusCode == 200) {
      setState(() {
        countydata = json.decode(res.body);
        // if (countydata["error"]) {
        //   //check fi there is any error from server.
        //   error = true;
        //   message = countydata["errmsg"];
        // }
      });
    } else {
      //there is error
      setState(() {
        error = true;
        message = "Error during fetching data";
      });
    }
  }

  Future<List<FacilityModel>> getFacilities(filter) async {
    var response = await http.post(
        Uri.parse(globals.url.toString() + "getFacilities"));

    final data = json.decode(response.body);
    //print(data);
    if (data != null) {
      //print(data.length);
      return FacilityModel.fromJsonList(data);
    }

    return [];

  }

  Future registerDefaulter() async {
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
    });

    var data = jsonDecode(response.body);
    if (data == "Error") {
      // Scaffold.of(context).showSnackBar(SnackBar(
      print('Could not Add Health Worker');
      // ));
    } else {
      print('Successfully Added Healthworker');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Defaulters()));
    }
  }

  submit() async {
    // First validate form.
    // var form = formKey.currentState;
    // if (form.validate()) {
    // form.save();
    setState(() {
      _myActivityResult = _myActivity;
    });

    DBProvider.createWorker(
        names.text,
        phone.text,
        facility.text,
        county.text,
        subcounty.text,
        mflcode.text,
        venue.text,
        gathering.text,
        menreached.text,
        womenreached.text,
        disabledreached.text);
    //this.registerDefaulter();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AwarenessApp())
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: secondaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme
            .of(context)
            .textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: Scaffold(
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
          child: Form(
            key: formKey,

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
                          style: TextStyle(fontSize: 25.0,
                              fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  TextFormField(
                    controller: names,
                    decoration: InputDecoration(
                      hintText: 'Names of CHF',
                      labelText: "Name of CHF",
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
                      labelText: "Phone",
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
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        value: countyname,
                        hint: Text('Choose a county'),
                        decoration: InputDecoration(
                          labelText: "County",
                        ),
                        items: counties.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          getSubCounty();
                          countyname = value.toString(); //change the country name
                          county.text=value.toString();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container( //wrapper for City list
                    // margin: EdgeInsets.only(top:10),
                    child: error ? Text(message) :
                    countydata == null ?
                    Text("Choose Sub County") :
                    wardList(),
                    //if there is error then show error message,
                    //else check if data is null,
                    //if not then show city list,

                  ),
                  SizedBox(height: 20.0,),
                  DropdownSearch<FacilityModel>(
                    // items: [
                    //   FacilityModel(facilityname: "Offline name1", mflcode: 999),
                    //   FacilityModel(facilityname: "Offline name2", mflcode: 101)
                    // ],
                    maxHeight: 300,
                    onFind:(filter)=>getFacilities(filter),
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Name of Health Facility",
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value){
                      mflcode.text=value!.mflcode.toString();
                      facility.text=value.facilityname.toString();
                    },
                    showSearchBox: true,
                  ),

                  SizedBox(height: 20.0,),
                  TextFormField(
                    obscureText: false,
                    controller: mflcode,
                    decoration: InputDecoration(
                      labelText: "Facility MFL Code",
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
                      labelText:'Venue of Awareness Creation',
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
                    items: [
                      "Church",
                      "Chief Baraza",
                      "Women’s Group",
                      "Men’s Group",
                      "Market",
                      "Other"
                    ],
                    mode: Mode.MENU,
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Type of Gathering/Group",
                      labelText: "Type of Gathering/Group",
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value){
                      gathering.text=value.toString();
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: false,
                    controller: menreached,
                    decoration: InputDecoration(
                      hintText: 'Men Reached',
                      labelText: "Men Reached",
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
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: false,
                    controller: womenreached,
                    decoration: InputDecoration(
                      hintText: 'Number Women Reached',
                      labelText: 'Number Women Reached',
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
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: false,
                    controller: disabledreached,
                    decoration: InputDecoration(
                      hintText: 'Disabled Reached',
                      labelText: 'Disabled Reached',
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

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text('Forget password?',style: TextStyle(fontSize: 12.0),),
                        ElevatedButton.icon(
                          label: Text('REGISTER'),
                          icon: Icon(Icons.save),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepOrange,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )),
                          onPressed: () {
                            formKey.currentState?.save();
                            if (formKey.currentState!.validate()) {
                              this.submit();
                            } else {
                              print("validation failed");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
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


  Widget wardList() {
    //widget function for city list
    List<WardOne> wordList = List<WardOne>.from(
        countydata.map((i) {
          return WardOne.fromJSON(i);
        })
    ); //searilize citylist json data to object model.

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
            color: Colors.grey, style: BorderStyle.solid, width: 0.80),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonFormField (
          hint: Text("Select Sub County"),
          isExpanded: true,
          value: subcountyname,
          decoration: InputDecoration(
            labelText: 'Sub-County',
          ),
          items: wordList.map((wordOne) {
            return DropdownMenuItem(
              child: Text(wordOne.subcounty),
              value: wordOne.subcounty,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              subcountyname = value;
              subcounty.text=value.toString();
            });
            // <-- Will trigger re-build on StatefulWidget
            print("Selected city is $value");
          },

        ),
      ),
    );
  }

}
//model class to searilize country list JSON data.
class WardOne{
  int id;
  String county, subcounty;
  WardOne({required this.id, required this.county, required this.subcounty});

  factory WardOne.fromJSON(Map<String, dynamic> json){
    return WardOne(
        id:json["id"],
        county: json["county"],
        subcounty: json["subcounty"]
    );
  }
}
