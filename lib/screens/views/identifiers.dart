import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Identifiers extends StatefulWidget {
  const Identifiers({Key? key}) : super(key: key);

  @override
  _IdentifiersState createState() => _IdentifiersState();
}

class _IdentifiersState extends State<Identifiers> {
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
