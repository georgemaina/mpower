import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Anaemia extends StatefulWidget {
  const Anaemia({Key? key}) : super(key: key);

  @override
  _AnaemiaState createState() => _AnaemiaState();
}

class _AnaemiaState extends State<Anaemia> {
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
                  name: 'Diabetes',
                  orientation: OptionsOrientation.vertical,
                  options: [
                    FormBuilderFieldOption(value: 'What is Sickle Cell Disease?'),
                    FormBuilderFieldOption(value: 'Symptoms and complications of Sickle Cell Disease'),
                    FormBuilderFieldOption(value: 'Diagnosis of Sickle Cell Disease'),
                    FormBuilderFieldOption(value: 'Access to Treatment of Sickle Cell Disease'),
                    FormBuilderFieldOption(value: 'Family Tree Counselling and Testing for Sickle Cell Disease'),
                  ])
            ],
          ),
        )
      ],
    );
  }
}
