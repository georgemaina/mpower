import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Referral extends StatefulWidget {
  const Referral({Key? key}) : super(key: key);

  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
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
                name: 'voucher',
                decoration: InputDecoration(
                  labelText:'VOUCHER NUMBER',
                  //hintText: 'MOBILE PHONE NUMBER'
                ),
              ),
              FormBuilderTextField(
                name: 'referto',
                decoration: InputDecoration(
                  labelText:'REFER TO',
                  //hintText: 'NATIONAL ID'
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
