import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Enrollment extends StatefulWidget {
  const Enrollment({Key? key}) : super(key: key);

  @override
  _EnrollmentState createState() => _EnrollmentState();
}

class _EnrollmentState extends State<Enrollment> {
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
                name: 'firstname',
                decoration: InputDecoration(
                  labelText:'First Name.',
                  hintText: 'First Name'
                ),
              ),
              FormBuilderTextField(
                name: 'lastname',
                decoration: InputDecoration(
                    labelText:'Last Name.',
                    hintText: 'Last Name'
                ),
              ),
              FormBuilderTextField(
                name: 'dob',
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
                  )
            ],
          ),
        )
      ],
    );
  }
}
