import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'screens/globals.dart' as globals;
import 'package:mpower/welcome.dart';
import 'package:geolocator/geolocator.dart';



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) {
        if (host == '40.71.71.47') {
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
  // TextEditingController location = TextEditingController();

  // String _chosenValue="";
  // String _myActivity;
  // String _myActivityResult;
  bool _isObscure=true;

  Future login()async{
    String url=globals.url.toString() + "login";

    var response=await http.post(Uri.parse(url),body: {
      "username":username.text,
      "password":password.text,
      "userGroup":"Admin",
    });
    print(url);
    print(response.body);

    var data=jsonDecode(response.body);
    print(data);

    // String user=username.text;
    if(data=="Error"){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid Username and Password.'),
        ),
      );
    }else{
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>myMain())
      );
      globals.isLoggedIn = true;
      globals.loggedUser =username.text;
    }
  }


  final formKey =new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // _myActivity = '';
    // _myActivityResult = '';
  }


  // Map<String, dynamic> formData;
  void submit(){
    // First validate form.
    if (this.formKey.currentState!.validate()) {
      this.login();
      formKey.currentState!.save(); // Save our form now.

      // print('Printing the login data.');
      // print('Mobile: ${_data.username}');
      // print('Password: ${_data.password}');

    }
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
                    SizedBox(height:20.0),
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
                    SizedBox(height:20.0),
                    // Container(
                    //   padding: EdgeInsets.all(10),
                    //   child: DropdownSearch<String>(
                    //     validator: (v) => v == null ? "required field" : null,
                    //     dropdownSearchDecoration: InputDecoration(
                    //       hintText: "LOCATION TYPE",
                    //       labelText: "LOCATION TYPE *",
                    //       contentPadding: EdgeInsets.all(10),
                    //       border: OutlineInputBorder(),
                    //     ),
                    //     mode: Mode.MENU,
                    //     showSelectedItems: true,
                    //     items: ["HEALTH FACILITY", "CU"],
                    //     onChanged: print
                    //   ),
                    // ),
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
