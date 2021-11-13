import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Epilepsy extends StatefulWidget {
  const Epilepsy({Key? key}) : super(key: key);

  @override
  _EpilepsyState createState() => _EpilepsyState();
}

class _EpilepsyState extends State<Epilepsy> {
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
                  name: 'Epilepsy',
                  orientation: OptionsOrientation.vertical,
                  options: [
                    FormBuilderFieldOption(value: 'Definition and presentation of Epilepsy'),
                    FormBuilderFieldOption(value: 'Causes, myths and misconceptions of Epilepsy'),
                    FormBuilderFieldOption(value: 'How to live positively with Epilepsy'),
                    FormBuilderFieldOption(value: 'How to support someone having an Epileptic seizure'),
                  ])
            ],
          ),
        )
      ],
    );
  }
}
