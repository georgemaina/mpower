import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BloodSugar extends StatefulWidget {
  const BloodSugar({Key? key}) : super(key: key);

  @override
  _BloodSugarState createState() => _BloodSugarState();
}

class _BloodSugarState extends State<BloodSugar> {
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
              FormBuilderTextField(
                name: 'bloodsugar',
                decoration: InputDecoration(
                    labelText:'TESTING BLOOD SUGAR',
                    //hintText: 'TESTING BLOOD SUGAR'
                ),
              ),
              FormBuilderTextField(
                name: 'lastmeal',
                decoration: InputDecoration(
                    labelText:'HOW MANY HOURS HAS IT BEEN SINCE THE CLIENT LAST ATE,DRUNK ANYTHING BUT WATER.',
                   // hintText: 'NATIONAL ID'
                ),
              ),
              FormBuilderTextField(
                name: 'bsresults',
                decoration: InputDecoration(
                  labelText:'BLOOD SUGAR TEST RESULT.',
                ),
                keyboardType: TextInputType.number,
              )
            ],
          ),
        )
      ],
    );
  }
}
