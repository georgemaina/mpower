import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;

class Hypertension extends StatefulWidget {
  const Hypertension({Key? key}) : super(key: key);

  @override
  _HypertensionState createState() => _HypertensionState();
}

class _HypertensionState extends State<Hypertension> {
  final _contentStyle = TextStyle(color: Color(0xff999999), fontSize: 18, fontWeight: FontWeight.normal);

  final _formKey = GlobalKey<FormBuilderState>();
  Map appData = Map<String,dynamic>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        FormBuilder(
          key: _formKey,
          //autovalidateMode: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: FormBuilderCheckbox(name: 'bp1',title:Text('Understanding hypertension',style: _contentStyle,),
                    onChanged:( val) {
                      setState(() {
                        globals.bp1=val.toString();
                      });
                    }),
              ),
              SizedBox(
                child: FormBuilderCheckbox(name: 'bp2',title:Text('Risk factors for hypertension',style: _contentStyle,),
                    onChanged:( val) {
                      setState(() {
                        globals.bp2=val.toString();
                      });
                    }),
              ),
              FormBuilderCheckbox(name: 'bp3',title:Text('Signs and symptoms of hypertension',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.bp3=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'bp4',title:Text('Understanding BP readings',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.bp4=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'bp5',title:Text('Controlling high blood pressure',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.bp5=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'bp6',title:Text('Healthy diet',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.bp6=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'bp7',title:Text('Physical activity',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.bp7=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'bp8',title:Text('Treatment of high blood pressure',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.bp8=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'bp9',title:Text('Complications of high blood pressure',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.bp9=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'bp10',title:Text('Side effects of blood pressure medication',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.bp10=val.toString();
                    });
                  }),

            ],
          ),
        )
      ],
    );
  }
}
