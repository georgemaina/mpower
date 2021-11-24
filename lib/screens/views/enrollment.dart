import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:mpower/database.dart';
import 'package:mpower/screens/globals.dart' as globals;
// import 'package:mpower/main.dart';

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

    @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: _formKey,
            //autovalidateMode: true,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FormBuilderTextField(
                  name: 'firstname',
                  controller: firstname,
                  decoration: InputDecoration(
                    labelText: 'First Name.',
                    // hintText: 'First Name'
                  ),
                    onChanged:(val) {
                      setState(() {
                        globals.firstname=val.toString();
                        print('First name='+val.toString());
                      });
                    },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter First Name';
                    }
                    return null;
                  },
                ),
                FormBuilderTextField(
                  name: 'lastname',
                  controller: lastname,
                  decoration: InputDecoration(
                    labelText: 'Last Name.',
                    // hintText: 'Last Name'
                  ),
                    onChanged:(val) {
                      setState(() {
                        globals.lastname=val.toString();
                        print('Last name='+val.toString());
                      });
                    },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                FormBuilderTextField(
                  name: 'dob',
                  controller: dob,
                  decoration: InputDecoration(
                    labelText: 'Year of Birth.',
                  ),
                  keyboardType: TextInputType.number,
                    onChanged:(val) {
                      setState(() {
                        globals.dob=val.toString();
                        print('DOB='+val.toString());
                      });
                    },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Year of Birth';
                    }
                    return null;
                  },
                ),
                FormBuilderRadioGroup(
                    name: 'Sex',
                    options: [
                      FormBuilderFieldOption(value: 'Male'),
                      FormBuilderFieldOption(value: 'Female'),
                    ],
                    decoration: InputDecoration(
                      labelText: 'SEX',
                    ),
                    onChanged: (val) {
                      setState(() {
                        globals.sex = val.toString();
                        print(val.toString());
                      });
                    }
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}