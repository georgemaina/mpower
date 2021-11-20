import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/database.dart';
import 'package:mpower/screens/globals.dart' as globals;

final enroll = new GlobalKey<_EnrollmentState>();

class Enrollment extends StatefulWidget {
  const Enrollment({Key? key}) : super(key: key);

  @override
  _EnrollmentState createState() => _EnrollmentState();
}

class _EnrollmentState extends State<Enrollment> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController dob = TextEditingController();
  // TextEditingController surname=TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

 submitForm(){
    // First validate form.
    globals.firstname=this.firstname.text;
    globals.lastname=this.lastname.text;
    globals.dob=this.dob.text;

    print(globals.firstname);
    print(globals.lastname);
    print(globals.dob);

  }

 Future _onChanged() async{
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      print(_formKey.currentState!.value);
    } else {
      print("validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        FormBuilder(
          key: _formKey,
          //autovalidateMode: true,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,

            children: <Widget>[
              FormBuilderTextField(
                name: 'firstname',
                controller: firstname,
                decoration: InputDecoration(
                  labelText:'First Name.',
                  // hintText: 'First Name'
                ),
              ),
              FormBuilderTextField(
                name: 'lastname',
                controller: lastname,
                decoration: InputDecoration(
                    labelText:'Last Name.',
                    // hintText: 'Last Name'
                ),
              ),
              FormBuilderTextField(
                name: 'dob',
                controller: dob,
                decoration: InputDecoration(
                  labelText:'Year of Birth.',
                ),
                keyboardType: TextInputType.number,
              ),
              FormBuilderRadioGroup(
                  name: 'Sex',
                  options:[
                    FormBuilderFieldOption(value: 'Male'),
                    FormBuilderFieldOption(value: 'Female'),
                  ],
                decoration: InputDecoration(
                  labelText:'SEX',
                ),
                    onChanged:(val) {
                      setState(() {
                          globals.sex=val.toString();
                          print(val.toString());
                      });
                    }
                    ),
            ],
          ),
        )
      ],
    );
  }
}
