import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:mpower/database.dart';
import 'health_workers.dart';

class Referral extends StatefulWidget {
  const Referral({Key? key}) : super(key: key);

  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  final _formKey = GlobalKey<FormBuilderState>();

  submit() async{

    DBProvider.enrollClient(globals.firstname,globals.lastname,globals.dob,globals.sex,globals.phone,
    globals.nationalid,globals.opdno,globals.alcohol,globals.tobacco,globals.diet,
    globals.exercise,globals.hypertensive,globals.bp_treatment,globals.diabetic,globals.diabetes_treatment,
    globals.systolic,globals.diastolic,globals.systolic2,globals.diastolic2,globals.test_bs,
    globals.last_meal,globals.bs_results,globals.weight,globals.height,globals.voucher_no, globals.refer_to);
    //this.registerDefaulter();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>Workers())
    );

    // print('Printing the login data.');
    // print('Mobile: ${_data.username}');
    // print('Password: ${_data.password}');

    // }
  }

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
                name: 'voucher',
                decoration: InputDecoration(
                  labelText:'VOUCHER NUMBER',
                  //hintText: 'MOBILE PHONE NUMBER'
                ),
                  onChanged:(val) {
                    setState(() {
                      globals.voucher_no=val.toString();
                      print('voucher='+val.toString());
                    });
                  }
              ),
              FormBuilderTextField(
                name: 'referto',
                decoration: InputDecoration(
                  labelText:'REFER TO',
                  //hintText: 'NATIONAL ID'
                ),
                  onChanged:(val) {
                    setState(() {
                      globals.refer_to=val.toString();
                      print('Refer To='+val.toString());
                    });
                  }
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      this.submit();
                    },
                    child: const Text('ENROLL CLIENT'),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(240, 80), primary: Colors.deepOrange),
                  ),),
            ],
          ),
        )
      ],
    );
  }
}
