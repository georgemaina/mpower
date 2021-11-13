import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
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
                name: 'weight',
                decoration: InputDecoration(
                    labelText:'WEIGHT(kgs)',
                    //hintText: 'MOBILE PHONE NUMBER'
                ),
              ),
              FormBuilderTextField(
                name: 'height',
                decoration: InputDecoration(
                    labelText:'HEIGHT(cms).',
                    //hintText: 'NATIONAL ID'
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
