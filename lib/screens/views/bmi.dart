import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

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
                controller: weight,
                decoration: InputDecoration(
                    labelText:'WEIGHT(kgs)',
                    //hintText: 'MOBILE PHONE NUMBER'
                ),
                  onChanged:(val) {
                    setState(() {
                      globals.weight=val.toString();
                      print('Weight='+val.toString());
                    });
                  }
              ),
              FormBuilderTextField(
                name: 'height',
                controller: height,
                decoration: InputDecoration(
                    labelText:'HEIGHT(cms).',
                    //hintText: 'NATIONAL ID'
                ),
                  onChanged:(val) {
                    setState(() {
                      globals.height=val.toString();
                      print('Height='+val.toString());
                    });
                  }
              )
            ],
          ),
        )
      ],
    );
  }
}
