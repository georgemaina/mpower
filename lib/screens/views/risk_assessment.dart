import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
              )
            ],
          ),
        )
      ],
    );
  }
}
