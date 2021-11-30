import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:intl/intl.dart';
import 'package:mpower/screens/awareness_home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/views/treatment.dart';
import 'package:mpower/database.dart';

class RiskAssessment extends StatefulWidget {
  const RiskAssessment({Key? key}) : super(key: key);

  @override
  _RiskAssessmentState createState() => _RiskAssessmentState();
}

class _RiskAssessmentState extends State<RiskAssessment> {
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
          title: Text("Risk Assessment"),
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
            child:  FormBuilder(
              key: _formKey,
              //autovalidateMode: true,
              child: Column(
                children: <Widget>[
                  FormBuilderRadioGroup(
                      name: 'alcohol',
                      options:[
                        FormBuilderFieldOption(value: 'Yes'),
                        FormBuilderFieldOption(value: 'No'),
                      ],
                      decoration: InputDecoration(
                        labelText:'DOES THE CLIENT CONSUME ALCOHOL?',
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.alcohol=val.toString();
                          print('Alcohol consumption:'+val.toString());
                        });
                      }
                  ),
                  FormBuilderRadioGroup(
                      name: 'tobacco',
                      options:[
                        FormBuilderFieldOption(value: 'Yes'),
                        FormBuilderFieldOption(value: 'No'),
                      ],
                      decoration: InputDecoration(
                        labelText:'DOES THE CLIENT SMOKE, CHEW OR SNIFF TOBACCO?',
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.tobacco=val.toString();
                          print('Smoking:'+val.toString());
                        });
                      }
                  ),
                  FormBuilderRadioGroup(
                      name: 'diet',
                      options:[
                        FormBuilderFieldOption(value: 'Yes'),
                        FormBuilderFieldOption(value: 'No'),
                      ],
                      decoration: InputDecoration(
                        labelText:'DOES THE CLIENT MAINTAIN A HEALTHY DIET',
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.diet=val.toString();
                          print('Health Diet:'+val.toString());
                        });
                      }
                  ),
                  FormBuilderRadioGroup(
                      name: 'exercise',
                      options:[
                        FormBuilderFieldOption(value: 'Yes'),
                        FormBuilderFieldOption(value: 'No'),
                      ],
                      decoration: InputDecoration(
                        labelText:'DOES THE CLIENT EXERCISE ROUTINELY',
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.exercise=val.toString();
                          print('Exercise:'+val.toString());
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
                            MaterialPageRoute(builder: (context)=>Treatment())
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
