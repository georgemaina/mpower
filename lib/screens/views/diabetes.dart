import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:intl/intl.dart';

class Diabetes extends StatefulWidget {
  const Diabetes({Key? key}) : super(key: key);

  @override
  _DiabetesState createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
  final _contentStyle = TextStyle(color: Color(0xff999999), fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  final _formKey = GlobalKey<FormBuilderState>();
 final List<String> data = <String>[];
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        FormBuilder(
          key: _formKey,
          //autovalidateMode: true,
          child: Column(
            children: <Widget>[
              FormBuilderCheckbox(name: 'dbt1',title:Text('Understanding diabetes',style: _contentStyle),
                  initialValue: false,
                  onChanged:(val) {
                    setState(() {
                      print(formatted);
                      print(val);
                      globals.dbt1=val.toString();
                      print( globals.dbt1);
                    });
                  }),
              FormBuilderCheckbox(name: 'dbt2',title:Text('Risk factors for diabetes',style: _contentStyle,),
                  onChanged:(val) {
                    setState(() {
                      globals.dbt2=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'dbt3',title:Text('Signs and symptoms of diabetes',style: _contentStyle,),
                  onChanged:(val) {
                    setState(() {
                      globals.dbt3=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'dbt4',title:Text('Prevention of diabetes',style: _contentStyle,),
                  onChanged:(val) {
                    setState(() {
                      globals.dbt4=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'dbt5',title:Text('Healthy diet',style: _contentStyle,),
                  onChanged:(val) {
                    setState(() {
                      globals.dbt5=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'dbt6',title:Text('Physical activity',style: _contentStyle,),
                  onChanged:(val) {
                    setState(() {
                      globals.dbt6=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'dbt7',title:Text('How to manage diabetes',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.dbt7=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'dbt8',title:Text('Complications of diabetes',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.dbt8=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'dbt9',title:Text('Procedure for blood glucose testing',style: _contentStyle,),
                  onChanged:(val) {
                    setState(() {
                      globals.dbt9=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'dbt10',title:Text('Myths and Misconceptions of diabetes',style: _contentStyle,),
                  onChanged:(val) {
                    setState(() {
                      globals.dbt10=val.toString();
                    });
                  }),

            ],
          ),
        )
      ],
    );
  }
}
