import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Treatment extends StatefulWidget {
  const Treatment({Key? key}) : super(key: key);

  @override
  _TreatmentState createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
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
                name: 'hypertensive',
                options:[
                  FormBuilderFieldOption(value: 'Yes'),
                  FormBuilderFieldOption(value: 'No'),
                ],
                decoration: InputDecoration(
                  labelText:'IS THE PATIENT KNOWN HYPERTENSIVE?',
                ),
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
              )
            ],
          ),
        )
      ],
    );
  }
}
