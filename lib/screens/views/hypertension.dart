import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Hypertension extends StatefulWidget {
  const Hypertension({Key? key}) : super(key: key);

  @override
  _HypertensionState createState() => _HypertensionState();
}

class _HypertensionState extends State<Hypertension> {
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
                    FormBuilderFieldOption(value: 'Understanding hypertension'),
                    FormBuilderFieldOption(value: 'Risk factors for hypertension '),
                    FormBuilderFieldOption(value: 'Signs and symptoms of hypertension'),
                    FormBuilderFieldOption(value: 'Understanding BP readings'),
                    FormBuilderFieldOption(value: 'Controlling high blood pressure'),
                    FormBuilderFieldOption(value: 'Healthy diet'),
                    FormBuilderFieldOption(value: 'Physical activity'),
                    FormBuilderFieldOption(value: 'Treatment of high blood pressure'),
                    FormBuilderFieldOption(value: 'Complications of high blood pressure'),
                    FormBuilderFieldOption(value: 'Side effects of blood pressure medication'),
                  ])
            ],
          ),
        )
      ],
    );
  }
}
