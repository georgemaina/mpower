import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/models/facilities.dart';
import 'package:mpower/database.dart';
import 'package:mpower/screens/globals.dart' as globals;// import 'health_workers.dart';
import 'package:intl/intl.dart';
import 'package:mpower/screens/views/review_enrollments.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:mpower/screens/screening.dart';

class Referral extends StatefulWidget {
  const Referral({Key? key}) : super(key: key);

  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController voucher = TextEditingController();
  TextEditingController referto = TextEditingController();
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  // TextEditingController surname=TextEditingController();
  submit() async{
    DBProvider.enrollClient(globals.firstname,globals.lastname,globals.dob,globals.sex,globals.pregnant,globals.phone,
        globals.nationalid,globals.opdno,globals.alcohol,globals.tobacco,globals.diet,
        globals.exercise,globals.hypertensive,globals.bp_treatment,globals.diabetic,globals.diabetes_treatment,
        globals.systolic,globals.diastolic,globals.systolic2,globals.diastolic2,globals.test_bs,
        globals.last_meal,globals.bs_results,globals.bs_reason,globals.weight,globals.height,globals.voucher_no,
        globals.refer_to,formatted);
    //this.registerDefaulter();
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>Enrollments())
    );
  }
  Future<List<FacilityModel>> getFacilities(filter) async {
    var response = await http.post(
        Uri.parse(globals.url.toString() + "getFacilities"));

    final data = json.decode(response.body);
    //print(data);
    if (data != null) {
      //print(data.length);
      return FacilityModel.fromJsonList(data);
    }

    return [];

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
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: secondaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme
            .of(context)
            .textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Refer Client"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>ScreeningHome())
              );
            },
          ),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child:  FormBuilder(
              key: _formKey,
              //autovalidateMode: true,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                      name: 'voucher',
                      decoration: InputDecoration(
                        labelText:'VOUCHER NUMBER',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        //hintText: 'MOBILE PHONE NUMBER'
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.voucher_no=val.toString();
                          print('voucher='+val.toString());
                        });
                      }
                  ),
                  SizedBox(height: 20.0,),
                  DropdownSearch<FacilityModel>(
                    maxHeight: 300,
                    onFind:(filter)=>getFacilities(filter),
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "REFER TO ",
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value){
                      globals.refer_to=value.toString();
                    },
                    showSearchBox: true,
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
            ),
          ),
        ),
      ),
    );
  }
}
