import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({Key? key}) : super(key: key);

  @override
  _BloodPressureState createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
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
                name: 'phone',
                decoration: InputDecoration(
                    labelText:'MOBILE PHONE NUMBER',
                    hintText: 'MOBILE PHONE NUMBER'
                ),
              ),
              FormBuilderTextField(
                name: 'ID',
                decoration: InputDecoration(
                    labelText:'NATIONAL ID.',
                    hintText: 'NATIONAL ID'
                ),
              ),
              FormBuilderTextField(
                name: 'opdNo',
                decoration: InputDecoration(
                  labelText:'OPD NUMBER.',
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
