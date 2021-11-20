import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;


class RiskAssessment extends StatefulWidget {
  const RiskAssessment({Key? key}) : super(key: key);

  @override
  _RiskAssessmentState createState() => _RiskAssessmentState();
}

class _RiskAssessmentState extends State<RiskAssessment> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        FormBuilder(
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
              )
            ],
          ),
        )
      ],
    );
  }
}
