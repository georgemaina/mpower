import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;

class DiabetesRetinopathy extends StatefulWidget {
  const DiabetesRetinopathy({Key? key}) : super(key: key);

  @override
  _DiabetesRetinopathyState createState() => _DiabetesRetinopathyState();
}

class _DiabetesRetinopathyState extends State<DiabetesRetinopathy> {
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
                    FormBuilderCheckbox(name: 'dr1',title:Text('What is Diabetes Retinopathy?',style: _contentStyle,),
                        onChanged:( val) {
                          setState(() {
                            globals.dr1=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dr2',title:Text('Types of Retinopathy',style: _contentStyle,),
                        onChanged:( val) {
                          setState(() {
                            globals.dr2=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dr3',title:Text('Risk factors for developing Diabetes Retinopathy'
                      ,style: _contentStyle,),
                        onChanged:( val) {
                          setState(() {
                            globals.dr3=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dr4',title:Text('Risk factors for developing Diabetes Retinopathy',style: _contentStyle,),
                        onChanged:( val) {
                          setState(() {
                            globals.dr4=val.toString();
                          });
                        }),
                    FormBuilderCheckbox(name: 'dr5',title:Text('Risk factors for developing Diabetes Retinopathy',style: _contentStyle,),
                        onChanged:( val) {
                          setState(() {
                            globals.dr5=val.toString();
                          });
                        }),
            ],
          ),
        )
      ],
    );
  }
}
