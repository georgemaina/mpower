import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DiabetesRetinopathy extends StatefulWidget {
  const DiabetesRetinopathy({Key? key}) : super(key: key);

  @override
  _DiabetesRetinopathyState createState() => _DiabetesRetinopathyState();
}

class _DiabetesRetinopathyState extends State<DiabetesRetinopathy> {
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
              FormBuilderCheckboxGroup(
                  name: 'Diabetes Retinopathy',
                  orientation: OptionsOrientation.vertical,
                  options: [
                    FormBuilderFieldOption(value: 'What is Diabetes Retinopathy?'),
                    FormBuilderFieldOption(value: 'Types of Retinopathy'),
                    FormBuilderFieldOption(value: 'Risk factors for developing Diabetes Retinopathy'),
                    FormBuilderFieldOption(value: 'Prevention of Diabetes Retinopathy'),
                    FormBuilderFieldOption(value: 'Treatment for Diabetes Retinopathy'),
                  ])
            ],
          ),
        )
      ],
    );
  }
}
