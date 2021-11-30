import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/screening.dart';
import 'package:mpower/screens/views/referral.dart';
import 'package:mpower/database.dart';
import 'package:intl/intl.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  TextEditingController txtWeight = TextEditingController();
  TextEditingController txtHeight = TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();
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
      home:Scaffold(
        appBar: AppBar(
          title: Text("BMI"),
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
          height: height,
          width: width,
          child: FormBuilder(
            key: _formKey,
            //autovalidateMode: true,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                      name: 'weight',
                      controller: txtWeight,
                      decoration: InputDecoration(
                        labelText:'WEIGHT(kgs)',
                        //hintText: 'MOBILE PHONE NUMBER'
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.weight=val.toString();
                          print('Weight='+val.toString());
                        });
                      }
                  ),
                  FormBuilderTextField(
                      name: 'height',
                      controller: txtHeight,
                      decoration: InputDecoration(
                        labelText:'HEIGHT(cms).',
                        //hintText: 'NATIONAL ID'
                      ),
                      onChanged:(val) {
                        setState(() {
                          globals.height=val.toString();
                          print('Height='+val.toString());
                        });
                      }
                  ),
                  SizedBox(height: 10.0,),
                  ElevatedButton.icon(
                    label: Text('Save'),
                    icon: Icon(Icons.save),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        )),
                    onPressed: () {
                      _formKey.currentState?.save();
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>Referral())
                        );
                      } else {
                        print("validation failed");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
