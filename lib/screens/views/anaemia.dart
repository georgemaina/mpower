import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;


class Anaemia extends StatefulWidget {
  const Anaemia({Key? key}) : super(key: key);

  @override
  _AnaemiaState createState() => _AnaemiaState();
}

class _AnaemiaState extends State<Anaemia> {
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
              FormBuilderCheckbox(name: 'sca1',title: Text('What is Sickle Cell Disease?',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.sca1=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'sca2',title: Text('Symptoms and complications of Sickle Cell Disease'
                  ,style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.sca2=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'sca3',title: Text('Diagnosis of Sickle Cell Disease'
                ,style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.sca3=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'sca4',title: Text('Access to Treatment of Sickle Cell Disease'
                ,style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.sca4=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'sca5',title: Text('Family Tree Counselling and Testing for Sickle Cell Disease'
                ,style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.sca5=val.toString();
                    });
                  }),
            ],
          ),
        )
      ],
    );
  }
}
