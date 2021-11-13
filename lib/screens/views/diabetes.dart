import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Diabetes extends StatefulWidget {
  const Diabetes({Key? key}) : super(key: key);

  @override
  _DiabetesState createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
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
                    FormBuilderFieldOption(value: 'Understanding diabetes'),
                    FormBuilderFieldOption(value: 'Risk factors for diabetes'),
                    FormBuilderFieldOption(value: 'Signs and symptoms of diabetes'),
                    FormBuilderFieldOption(value: 'Prevention of diabetes'),
                    FormBuilderFieldOption(value: 'Healthy diet'),
                    FormBuilderFieldOption(value: 'Physical activity'),
                    FormBuilderFieldOption(value: 'How to manage diabetes'),
                    FormBuilderFieldOption(value: 'Complications of diabetes'),
                    FormBuilderFieldOption(value: 'Procedure for blood glucose testing'),
                    FormBuilderFieldOption(value: 'Myths and Misconceptions of diabetes'),
                  ])
            ],
          ),
        )
      ],
    );
  }
}
