import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:mpower/database.dart';
import 'package:mpower/screens/globals.dart' as globals;
// import 'package:mpower/welcome.dart';
import 'package:intl/intl.dart';
import 'package:mpower/screens/awareness_home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/screening.dart';
import 'package:mpower/screens/views/identifiers.dart';
import 'package:mpower/database.dart';

final enroll = new GlobalKey<_EnrollmentState>();

class Enrollment extends StatefulWidget {
  const Enrollment({Key? key}) : super(key: key);

  @override
  _EnrollmentState createState() => _EnrollmentState();
}

class _EnrollmentState extends State<Enrollment> {
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController dob = TextEditingController();

  // TextEditingController surname=TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();
  bool pregnantVisible = false ;

  void hideWidget(){
    setState(() {
      pregnantVisible=false;
    });
  }

  void showWidget(){
    setState(() {
      pregnantVisible=true;
    });
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
          title: Text("Enrollment"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>ScreeningHome())
              );
            },
          ),
        ),
        body: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: FormBuilder(
              key: _formKey,
              //autovalidateMode: true,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FormBuilderTextField(
                    name: 'firstname',
                    controller: firstname,
                    decoration: InputDecoration(
                      labelText: 'First Name.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // hintText: 'First Name'
                    ),
                    onChanged:(val) {
                      setState(() {
                        globals.firstname=val.toString();
                        print('First name='+val.toString());
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter First Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0,),
                  FormBuilderTextField(
                    name: 'lastname',
                    controller: lastname,
                    decoration: InputDecoration(
                      labelText: 'Last Name.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // hintText: 'Last Name'
                    ),
                    onChanged:(val) {
                      setState(() {
                        globals.lastname=val.toString();
                        print('Last name='+val.toString());
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0,),
                  FormBuilderTextField(
                    name: 'dob',
                    controller: dob,
                    decoration: InputDecoration(
                      labelText: 'Year of Birth.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged:(val) {
                      setState(() {
                        globals.dob=val.toString();
                        print('DOB='+val.toString());
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Year of Birth';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0,),
                  FormBuilderRadioGroup(
                      name: 'Sex',
                      options: [
                        FormBuilderFieldOption(value: 'Male'),
                        FormBuilderFieldOption(value: 'Female'),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Sex',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (val) {
                        setState(() {
                          globals.sex = val.toString();
                          if(val=='Female'){
                            this.showWidget();
                          }else{
                            this.hideWidget();
                          }
                          print(val.toString());
                        });
                      }
                  ),
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    visible: pregnantVisible,
                    child: FormBuilderRadioGroup(
                        name: 'PREGNANT',
                        options: [
                          FormBuilderFieldOption(value: 'Yes'),
                          FormBuilderFieldOption(value: 'No'),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Pregnant'
                              '',
                        ),
                        onChanged: (val) {
                          setState(() {
                            globals.pregnant = val.toString();
                            print(val.toString());
                          });
                        }
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  ElevatedButton.icon(
                    label: Text('Save'),
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
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>Identifiers())
                        );
                      } else {
                        print("validation failed");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}