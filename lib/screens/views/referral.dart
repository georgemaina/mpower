import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/main.dart';
import 'package:mpower/database.dart';
import 'package:mpower/screens/globals.dart' as globals;// import 'health_workers.dart';
import 'package:intl/intl.dart';

class Referral extends StatefulWidget {
  const Referral({Key? key}) : super(key: key);

  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController voucher = TextEditingController();
  TextEditingController referto = TextEditingController();
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  // TextEditingController surname=TextEditingController();
  submit() async{
    DBProvider.enrollClient(globals.firstname,globals.lastname,globals.dob,globals.sex,globals.phone,
        globals.nationalid,globals.opdno,globals.alcohol,globals.tobacco,globals.diet,
        globals.exercise,globals.hypertensive,globals.bp_treatment,globals.diabetic,globals.diabetes_treatment,
        globals.systolic,globals.diastolic,globals.systolic2,globals.diastolic2,globals.test_bs,
        globals.last_meal,globals.bs_results,globals.weight,globals.height,globals.voucher_no, globals.refer_to,formatted);
    //this.registerDefaulter();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>myMain())
    );
  }

  void _getReferalData() async {
    // First validate form.


    setState(() {
      globals.voucher_no = this.voucher.text;
      globals.refer_to = this.referto.text;
    });

    print(globals.voucher_no);
    print(globals.refer_to);
  }

  @override
  void initState() {
    super.initState();
    _getReferalData();
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
                  },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('Forget password?',style: TextStyle(fontSize: 12.0),),
                    ElevatedButton.icon(
                      label: Text('ENROLL CLIENT'),
                      icon:Icon(Icons.save),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          )),
                      onPressed: (){
                        _formKey.currentState?.save();
                        if (_formKey.currentState!.validate()) {
                          this.submit();
                        } else {
                          print("validation failed");
                        }

                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
}
