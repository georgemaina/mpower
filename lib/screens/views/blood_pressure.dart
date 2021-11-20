import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;


class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key}) : super(key: key);

  @override
  _BloodPressureState createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  TextEditingController systolic = TextEditingController();
  TextEditingController diastolic = TextEditingController();
  TextEditingController systolic2 = TextEditingController();
  TextEditingController diastolic2 = TextEditingController();


  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FormBuilder(
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
                                print('Systoric 1='+val.toString());
                              });
                            }
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
                              print('diastolic 1='+val.toString());
                            });
                          }
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
                        name: 'systolic2',
                        controller: systolic2,
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
                        controller: diastolic2,
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
                )


              ],
            )
        ),
      ],
    );
  }
}
