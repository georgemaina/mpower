import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;


class Identifiers extends StatefulWidget {
  const Identifiers({Key? key}) : super(key: key);

  @override
  _IdentifiersState createState() => _IdentifiersState();
}

class _IdentifiersState extends State<Identifiers> {
  TextEditingController phone = TextEditingController();
  TextEditingController nationalid = TextEditingController();
  TextEditingController opdno = TextEditingController();

  submitForm(){
    // First validate form.
    globals.phone=this.phone.text;
    globals.nationalid=this.nationalid.text;
    globals.opdno=this.opdno.text;

    print(globals.firstname);
    print(globals.lastname);
    print(globals.dob);
    // var sex=key.currentState!.se.text;
    // DBProvider.enrollClient(globals.firstname,globals.lastname, globals.dob,globals.sex);

  }

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
                controller: phone,
                decoration: InputDecoration(
                    labelText:'MOBILE PHONE NUMBER',
                    // hintText: 'MOBILE PHONE NUMBER'
                ),
                  onChanged:(val) {
                    setState(() {
                      globals.phone=val.toString();
                      print('Blood Sugar Result='+val.toString());
                    });
                  }
              ),
              FormBuilderTextField(
                name: 'nationalid',
                controller: nationalid,
                decoration: InputDecoration(
                    labelText:'NATIONAL ID.',
                    // hintText: 'NATIONAL ID'
                ),
                  onChanged:(val) {
                    setState(() {
                      globals.nationalid=val.toString();
                      print('Blood Sugar Result='+val.toString());
                    });
                  }
              ),
              FormBuilderTextField(
                name: 'opdno',
                controller: opdno,
                decoration: InputDecoration(
                  labelText:'OPD NUMBER.',
                ),
                keyboardType: TextInputType.number,
                  onChanged:(val) {
                    setState(() {
                      globals.opdno=val.toString();
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
