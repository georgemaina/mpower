import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;

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
                  onChanged:(val) {
                    setState(() {
                      globals.test_bs=val.toString();
                      print('Test Blood Sugar='+val.toString());
                    });
                  }
              ),
              FormBuilderTextField(
                name: 'lastmeal',
                decoration: InputDecoration(
                    labelText:'HOW MANY HOURS HAS IT BEEN SINCE THE CLIENT LAST ATE,DRUNK ANYTHING BUT WATER.',
                   // hintText: 'NATIONAL ID'
                ),
                  onChanged:(val) {
                    setState(() {
                      globals.last_meal=val.toString();
                      print('Time last meal or drink='+val.toString());
                    });
                  }
              ),
              FormBuilderTextField(
                name: 'bsresults',
                decoration: InputDecoration(
                  labelText:'BLOOD SUGAR TEST RESULT.',
                ),
                keyboardType: TextInputType.number,
                  onChanged:(val) {
                    setState(() {
                      globals.bs_results=val.toString();
                      print('Blood Sugar Result='+val.toString());
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
