import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/screening.dart';
import 'package:mpower/screens/views/bloodsugar.dart';
import 'package:mpower/database.dart';
import 'package:intl/intl.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key}) : super(key: key);

  @override
  _BloodPressureState createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  TextEditingController systolic = TextEditingController();
  TextEditingController diastolic = TextEditingController();
  TextEditingController bpSystolic2 = TextEditingController();
  TextEditingController bpDiastolic2 = TextEditingController();
  bool bp2Visible = false ;
  bool bpDiastolicStatus=false;
  bool bpSystolicStatus=false;

  void hideWidget(){
    setState(() {
      bp2Visible=false;
    });
  }

  void showWidget(){
    setState(() {
      bp2Visible=true;
    });
  }

  final _formKey = GlobalKey<FormBuilderState>();
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
          title: Text("Blood Pressure"),
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
        body:Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child:  FormBuilder(
                key:_formKey,
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(child:Container(
                          padding: EdgeInsets.only(top: 20),
                          alignment: Alignment.centerLeft,
                          child: Text('FIRST BP READING',style: TextStyle(fontSize: 13)),
                        ),
                        ),
                        Flexible(
                          child: FormBuilderTextField(
                              name: 'systolic',
                              controller: systolic,
                              decoration: InputDecoration(
                                labelText:'Systolic.',
                                // hintText: 'Systolic'
                              ),
                              onChanged:(val) {
                                setState(() {
                                  globals.systolic=val.toString();
                                  if(int.parse(val.toString())>140 || int.parse(val.toString())<90){
                                    bpSystolicStatus=true;
                                    bpDiastolicStatus=true;
                                  }else{
                                    bpSystolicStatus=false;
                                    bpDiastolicStatus=false;
                                    bpSystolic2.text="";
                                    bpDiastolic2.text="";

                                  }
                                  print('Systoric 1='+val.toString());
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter First Reading';
                                }
                                  return null;
                                },
                              ),

                        ),
                        VerticalDivider(),
                        Flexible(
                          child: FormBuilderTextField(
                              name: 'diastolic',
                              controller: diastolic,
                              decoration: InputDecoration(
                                labelText:'Diastolic.',
                                // hintText: 'Diastolic'
                              ),
                              onChanged:(val) {
                                setState(() {
                                  globals.diastolic=val.toString();
                                  if(int.parse(val.toString())>120 || int.parse(val.toString())<70){
                                    bpDiastolicStatus=true;
                                    bpSystolicStatus=true;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('BP is High please Take Second Reading.'),
                                      ),
                                    );
                                  }else{
                                    bpDiastolicStatus=false;
                                    bpSystolicStatus=false;
                                    bpSystolic2.text="";
                                    bpDiastolic2.text="";
                                  }
                                  print('diastolic 1='+val.toString());
                                });
                              },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter First Reading';
                              }
                              return null;
                            },
                          ),
                        ),
                        // Text("First BP"),

                      ],
                    ),
                    SizedBox(height:10.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(child:Container(
                          padding: EdgeInsets.only(top: 20),
                          alignment: Alignment.centerLeft,
                          child: Text('SECOND BP  READING  ',style: TextStyle(fontSize: 12)),
                        ),
                        ),
                        Flexible(
                          child: FormBuilderTextField(
                              name: 'Systolic2',
                              enabled: bpSystolicStatus,
                              controller: bpSystolic2,
                              decoration: InputDecoration(
                                labelText:'Systolic.',
                                // hintText: 'Systolic'
                              ),
                              onChanged:(val) {
                                setState(() {
                                  globals.systolic2=val.toString();
                                  print('Systoric 2='+val.toString());
                                });
                              }
                          ),
                        ),
                        VerticalDivider(),
                        Flexible(
                          child: FormBuilderTextField(
                              name: 'diastolic2',
                              controller: bpDiastolic2,
                              enabled: bpDiastolicStatus,
                              decoration: InputDecoration(
                                labelText:'Diastolic.',
                                // hintText: 'Diastolic'
                              ),
                              onChanged:(val) {
                                setState(() {
                                  globals.systolic2=val.toString();
                                  print('Systoric 2='+val.toString());
                                });
                              }
                          ),
                        ),

                        // Text("First BP"),

                      ],
                    ),
                    SizedBox(height: 20.0,),
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
                              MaterialPageRoute(builder: (context)=>BloodSugar())
                          );
                        } else {
                          print("validation failed");
                        }
                      },
                    ),

                  ],
                )
            ),
          ),
        )
      ),
    );
  }
}
