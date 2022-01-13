import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/Awareness.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:intl/intl.dart';
import 'package:mpower/screens/awareness_home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/awareness_home.dart';
import 'package:mpower/database.dart';

class Diabetes extends StatefulWidget {
  const Diabetes({Key? key}) : super(key: key);

  @override
  _DiabetesState createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  TextEditingController totalMaleDiabetes = TextEditingController();
  TextEditingController totalFemaleDiabetes = TextEditingController();
  TextEditingController totalDisableDiabetes = TextEditingController();
  List<Map<String, dynamic>> _listDiabetes = [];

  void submit() async{
    print(globals.dbt1.toString());
    // var now=DateTime.now();
    var user= globals.loggedUser.toString();
    DBProvider.addDiabetes(user,globals.dbt1.toString(), globals.dbt2.toString(), globals.dbt3.toString(), globals.dbt4.toString(),
        globals.dbt5.toString(), globals.dbt6.toString(), globals.dbt7.toString(), globals.dbt8.toString(),
        globals.dbt9.toString(), globals.dbt10.toString(),formatted,totalMaleDiabetes.text,totalFemaleDiabetes.text,
        totalDisableDiabetes.text,globals.meetingID.toString());

    // print("Male:"+totalMaleDiabetes.text);
    // print("Female:"+totalFemaleDiabetes.text);
    // print("Disabled:"+totalDisableDiabetes.text);
    // print("Meeting ID:"+globals.meetingID.toString());

    Navigator.push(context, MaterialPageRoute(builder: (context)=>AwarenessDashboard()));
    final data=await DBProvider.countRecords();

    setState(() {
      _listDiabetes=data;
      // print(_listDiabetes.length);
    });
  }

  final _formKey = GlobalKey<FormBuilderState>();
 final List<String> data = <String>[];
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
          title: Text("Diabetes"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>AwarenessDashboard())
              );
            },
          ),
        ),
        body: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children:<Widget> [
              FormBuilder(
                key: _formKey,
                //autovalidateMode: true,
                child: Column(
                  children: <Widget>[
                    FormBuilderCheckbox(name: 'dbt1',title:Text('Understanding diabetes',style: _contentStyle),
                        initialValue: false,
                        onChanged:(val) {
                          setState(() {
                            // print(formatted);
                            // print(val);
                            globals.dbt1=val.toString();
                            // print( globals.dbt1);
                          });
                        }),
                    FormBuilderCheckbox(name: 'dbt2',title:Text('Risk factors for diabetes',style: _contentStyle),
                        onChanged:(val) {
                          setState(() {
                            globals.dbt2=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dbt3',title:Text('Signs and symptoms of diabetes',style: _contentStyle,),
                        onChanged:(val) {
                          setState(() {
                            globals.dbt3=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dbt4',title:Text('Prevention of diabetes',style: _contentStyle,),
                        onChanged:(val) {
                          setState(() {
                            globals.dbt4=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dbt5',title:Text('Healthy diet',style: _contentStyle,),
                        onChanged:(val) {
                          setState(() {
                            globals.dbt5=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dbt6',title:Text('Physical activity',style: _contentStyle,),
                        onChanged:(val) {
                          setState(() {
                            globals.dbt6=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dbt7',title:Text('How to manage diabetes',style: _contentStyle,),
                        onChanged:( val) {
                          setState(() {
                            globals.dbt7=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dbt8',title:Text('Complications of diabetes',style: _contentStyle,),
                        onChanged:( val) {
                          setState(() {
                            globals.dbt8=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dbt9',title:Text('Procedure for blood glucose testing',style: _contentStyle,),
                        onChanged:(val) {
                          setState(() {
                            globals.dbt9=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dbt10',title:Text('Myths and Misconceptions of diabetes',style: _contentStyle,),
                        onChanged:(val) {
                          setState(() {
                            globals.dbt10=val.toString();
                          });
                        }),
                    FormBuilderTextField(
                        name: 'totalMaleDiabetes',
                        controller: totalMaleDiabetes,
                        decoration: InputDecoration(
                          labelText:'Total Male Clients Reached .',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          //hintText: 'NATIONAL ID'
                        ),
                        onChanged:(val) {
                          setState(() {
                            globals.totalMaleDiabetes=val.toString();
                            // print('Diabetes male'+val.toString());
                          });
                        }
                    ),
                    SizedBox(height: 10.0,),
                    FormBuilderTextField(
                        name: 'totalFemaleDiabetes',
                        controller: totalFemaleDiabetes,
                        decoration: InputDecoration(
                          labelText:'Total Female Clients Reached .',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          //hintText: 'NATIONAL ID'
                        ),
                        onChanged:(val) {
                          setState(() {
                            globals.totalFemaleDiabetes=val.toString();
                            // print('Diabetes Female='+val.toString());
                          });
                        }
                    ),
                    SizedBox(height: 10.0,),
                    FormBuilderTextField(
                        name: 'totalDisableDiabetes',
                        controller: totalDisableDiabetes,
                        decoration: InputDecoration(
                          labelText:'Total Disabled Clients Reached .',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          //hintText: 'NATIONAL ID'
                        ),
                        onChanged:(val) {
                          setState(() {
                            globals.totalDisabledDiabetes=val.toString();
                            // print('Diabetes Disabled='+val.toString());
                          });
                        }
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
                          this.submit();
                        } else {
                          print("validation failed");
                        }
                      },
                    ),

                  ],
                ),
              )
            ],
          ),
      ),
        ),
      ),


    );

  }
}
