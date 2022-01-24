import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'screens/globals.dart' as globals;
import 'package:mpower/welcome.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mpower/models/users.dart';
import 'package:mpower/models/facilities.dart';
import 'package:dropdown_search/dropdown_search.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) {
        if (host == '192.168.1.108') {
          return true;
        } else {
          return false;
        }
      });
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

// import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

// class _LoginData {
//   String username = '';
//   String password = '';
// }

class _State extends State<MyApp> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController facility = TextEditingController();
  TextEditingController mflcode = TextEditingController();
  // TextEditingController location = TextEditingController();
  var _userList = [];
  Future<Users>? _futureUsers;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    print(await Geolocator.getCurrentPosition());
    return await Geolocator.getCurrentPosition();
  }

  bool _isObscure=true;


  Future<Users> login() async{
    var value;
    String url=globals.url.toString() + "login";
    var response=await http.post(Uri.parse(url),body: {
      "username":username.text,
      "password":password.text,
      "userGroup":"Admin",
    });
    var data=jsonDecode(response.body);
     // String user=username.text;
    if(data=="Error"){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Username and Password.'),
        ),
      );
      value='Error';
    }else{
      globals.isLoggedIn = true;
      globals.loggedUser =username.text;
      value=new Users.fromJson(data);
      print(value.facility);
      globals.loggedUser=value.names;
      globals.mflcode=value.mflcode;
      globals.facility=value.facility;
      globals.phone=username.text;
      // buildFutureBuilder();
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>myMain())
      );
    }
    return value;
  }


  final formKey =new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // _myActivity = '';
    // _myActivityResult = '';
    // buildFutureBuilder();
  }


  // Map<String, dynamic> formData;
  void submit(){
    // First validate form.
    if (this.formKey.currentState!.validate()) {
      formKey.currentState!.save(); // Save our form now.
      // this.login();
     // _determinePosition();
      login();
    }
  }

  // //@override
  // FutureBuilder<Users> buildFutureBuilder() {
  //
  //   return FutureBuilder<Users>(
  //     future: login(),
  //     builder: (context, snapshot) {
  //       print(snapshot.hasData);
  //       if (snapshot.hasData) {
  //           print('Yes it has data');
  //           globals.loggedUser=snapshot.data!.names;
  //           globals.mflcode=snapshot.data!.mflcode;
  //           globals.facility=snapshot.data!.facility;
  //           print('Names'+snapshot.data!.names);
  //           print('Facility'+snapshot.data!.facility);
  //           print('mflcode'+snapshot.data!.mflcode);
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context)=>myMain())
  //           );
  //
  //          return Text(snapshot.data!.ID.toString());
  //       } else if (snapshot.hasError) {
  //           return Text('${snapshot.error}');
  //       }
  //
  //       return const CircularProgressIndicator();
  //     },
  //   );
  // }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('mPower'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child:Form(
                key:formKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'CHAK mPower',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Image.asset("assets/icons/icon.png",width: 100,height: 100,),
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: username,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'MOBILE PHONE NUMBER',
                        ),
                      ),
                    ),
                    SizedBox(height:10.0),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        obscureText: _isObscure,
                        controller: password,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'PASSWORD',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure?Icons.visibility:Icons.visibility_off,
                              ),
                              onPressed: (){
                                setState(() {
                                  _isObscure=!_isObscure;
                                });
                              },
                            )
                        ),
                      ),
                    ),
                    SizedBox(height:10.0),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: DropdownSearch<FacilityModel>(
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
                    ),
                    SizedBox(height: 20.0,),
                    // Container(
                    //   padding: EdgeInsets.all(10),
                    //   child: TextField(
                    //     controller: location,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       labelText: 'LOCATION',
                    //     ),
                    //   ),
                    // ),
                    // // FlatButton(
                    // //   onPressed: (){
                    // //     //forgot password screen
                    // //   },
                    // //   // textColor: Colors.blue,
                    // //   child: Text('Forgot Password'),
                    // // ),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton.icon(
                          // textColor: Colors.white,
                          // color: Colors.blue,
                          style:ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            textStyle: TextStyle(color:Colors.white,fontSize: 18),
                              ),
                          label: Text('LOGIN'),
                          icon: Icon(Icons.login),
                          onPressed: () {
                            // print(username.text);
                            // print(password.text);
                            this.submit();
                          },
                        )),
                    // Container(
                    //     child: Row(
                    //       children: <Widget>[
                    //         Text('Does not have account?'),
                    //         FlatButton(
                    //           textColor: Colors.blue,
                    //           child: Text(
                    //             'Sign in',
                    //             style: TextStyle(fontSize: 20),
                    //           ),
                    //           onPressed: () {
                    //             //signup screen
                    //           },
                    //         )
                    //       ],
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //     ))
                  ],
                ))));
  }
}
