import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/screening.dart';
import 'package:mpower/screens/views/blood_pressure.dart';
import 'package:mpower/database.dart';
import 'package:intl/intl.dart';

class Treatment extends StatefulWidget {
  const Treatment({Key? key}) : super(key: key);

  @override
  _TreatmentState createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

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
          title: Text("Treatment"),
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
            child:  FormBuilder(
              key: _formKey,
              //autovalidateMode: true,
              child: Column(
                children: <Widget>[
                  FormBuilderRadioGroup(
                      name: 'hypertensive',
                      options:[
                        FormBuilderFieldOption(value: 'Yes'),
                        FormBuilderFieldOption(value: 'No'),
                      ],
                      decoration: InputDecoration(
                        labelText:'IS THE PATIENT KNOWN HYPERTENSIVE?',
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.hypertensive=val.toString();
                          print('Hypertensive:'+val.toString());
                        });
                      }
                  ),
                  FormBuilderRadioGroup(
                      name: 'bptreament',
                      options:[
                        FormBuilderFieldOption(value: 'Yes'),
                        FormBuilderFieldOption(value: 'No'),
                      ],
                      decoration: InputDecoration(
                        labelText:'IS THE CLIENT ON TREATMENT FOR HYPERTENSION?',
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.bp_treatment=val.toString();
                          print('Hypertension Treament:'+val.toString());
                        });
                      }
                  ),
                  FormBuilderRadioGroup(
                      name: 'diabetic',
                      options:[
                        FormBuilderFieldOption(value: 'Yes'),
                        FormBuilderFieldOption(value: 'No'),
                      ],
                      decoration: InputDecoration(
                        labelText:'IS THE CLIENT KNOWN DIABETIC?',
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.diabetic=val.toString();
                          print('Diabetic:'+val.toString());
                        });
                      }
                  ),
                  FormBuilderRadioGroup(
                      name: 'diabetesTreatment',
                      options:[
                        FormBuilderFieldOption(value: 'Yes'),
                        FormBuilderFieldOption(value: 'No'),
                      ],
                      decoration: InputDecoration(
                        labelText:'IS THE CLIENT ON TREATMENT FOR DIABETES?',
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.diabetes_treatment=val.toString();
                          print('Diabetes Treament:'+val.toString());
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>BloodPressure())
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
