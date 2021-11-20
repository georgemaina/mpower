import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:getwidget/getwidget.dart';

class Epilepsy extends StatefulWidget {
  const Epilepsy({Key? key}) : super(key: key);

  @override
  _EpilepsyState createState() => _EpilepsyState();
}

class _EpilepsyState extends State<Epilepsy> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _contentStyle = TextStyle(color: Color(0xff999999), fontSize: 18, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        FormBuilder(
          key: _formKey,
          //autovalidateMode: true,
          child: Column(
            children: <Widget>[
              FormBuilderCheckbox(name: 'epy1', title:Text('Definition and presentation of Epilepsy',style: _contentStyle),
              onChanged:(val) {
                setState(() {
                  globals.epy1=val.toString();
                });
              }),
              FormBuilderCheckbox(name: 'epy2',title: Text('Causes, myths and misconceptions of Epilepsy',style: _contentStyle),
                  onChanged:(val) {
                    setState(() {
                      globals.bc2=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'epy3',title: Text('How to live positively with Epilepsy',style: _contentStyle),
                  onChanged:(val) {
                    setState(() {
                      globals.bc3=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'epy4',title: Text('How to support someone having an Epileptic seizure',style: _contentStyle),
                  onChanged:(val) {
                    setState(() {
                      globals.bc4=val.toString();
                    });
                  }),
                  ],

        ),
        )
      ],
    );
  }
}
