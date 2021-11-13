import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:validate/expect.dart';

class Cancer extends StatefulWidget {
  const Cancer({Key? key}) : super(key: key);

  @override
  _CancerState createState() => _CancerState();
}

class _CancerState extends State<Cancer> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        FormBuilder(
          key: _formKey,
          // autovalidateMode: AutovalidateMode(isTrue(expression)),
          child: Column(
            children: <Widget>[
              FormBuilderCheckboxGroup(
                  name: 'Breast Cancer',
                  orientation: OptionsOrientation.vertical,
                  options: [
                    FormBuilderFieldOption(value: 'What is breast cancer?'),
                    FormBuilderFieldOption(value: 'What to do to find breast cancer early?'),
                    FormBuilderFieldOption(value: 'What to do to lower chances of getting breast cancer?'),
                    FormBuilderFieldOption(value: 'Where to seek screening services?'),
                  ])
            ],
          ),
        )
      ],
    );
  }
}
