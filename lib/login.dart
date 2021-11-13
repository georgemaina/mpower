// @dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mpower/screens/main_screen.dart';
import 'package:validate/validate.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:http/http.dart' as http;
import 'screens/globals.dart' as globals;
import 'package:mpower/main.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

// import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _LoginData {
  String username = '';
  String password = '';
}

class _State extends State<MyApp> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();

  String _chosenValue="";
  String _myActivity;
  String _myActivityResult;
  bool _isObscure=true;

  Future login()async{
    String url=globals.url.toString() + "login";

    var response=await http.post(Uri.parse(url),body: {
      "username":username.text,
      "password":password.text,
      "userGroup":"Admin",
    });

    var data=jsonDecode(response.body);
    String user=username.text;
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
    }
  }


  final formKey =new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _LoginData _data = new _LoginData();

  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isAlphaNumeric(value);
    } catch (e) {
      return 'The Mobile number  must be a valid Phone number.';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 4) {
      return 'The Password must be at least 4 characters.';
    }

    return null;
  }

  // Map<String, dynamic> formData;
  void submit(){
    // First validate form.
    if (this.formKey.currentState.validate()) {
      this.login();
      formKey.currentState.save(); // Save our form now.

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
                    Container(
                      child: DropDownFormField(
                        titleText: 'LOCATION TYPE',
                        hintText: 'Please choose one',
                        value: _myActivity,

                        onSaved: (value) {
                          setState(() {
                            _myActivity = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _myActivity = value;
                          });
                        },
                        dataSource: [
                          {
                            "display": "CU",
                            "value": "CU",
                          },
                          {
                            "display": "HEALTH FACILITY",
                            "value": "HELTHFACILITY",
                          }
                        ],
                        textField: 'display',
                        valueField: 'value',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: location,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'LOCATION',
                        ),
                      ),
                    ),
                    // FlatButton(
                    //   onPressed: (){
                    //     //forgot password screen
                    //   },
                    //   // textColor: Colors.blue,
                    //   child: Text('Forgot Password'),
                    // ),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('LOGIN'),
                          onPressed: () {
                            print(username.text);
                            print(password.text);
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