import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/screening.dart';
import 'package:mpower/screens/views/identifiers.dart';
import 'package:mpower/database.dart';
import 'package:intl/intl.dart';
import 'package:mpower/screens/views/risk_assessment.dart';


class Identifiers extends StatefulWidget {
  const Identifiers({Key? key}) : super(key: key);

  @override
  _IdentifiersState createState() => _IdentifiersState();
}

class _IdentifiersState extends State<Identifiers> {
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

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
          title: Text("Identifiers"),
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
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: FormBuilder(
              key: _formKey,
              //autovalidateMode: true,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    name: 'phone',
                    controller: phone,
                    decoration: InputDecoration(
                      labelText:'Mobile Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // hintText: 'MOBILE PHONE NUMBER'
                    ),
                    onChanged:(val) {
                      setState(() {
                        globals.phone=val.toString();
                        // print('Blood Sugar Result='+val.toString());
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Phone Number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0,),
                  FormBuilderTextField(
                    name: 'nationalid',
                    controller: nationalid,
                    decoration: InputDecoration(
                      labelText:'National ID.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // hintText: 'NATIONAL ID'
                    ),
                    onChanged:(val) {
                      setState(() {
                        globals.nationalid=val.toString();
                        // print('Blood Sugar Result='+val.toString());
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter National ID';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0,),
                  FormBuilderTextField(
                      name: 'opdno',
                      controller: opdno,
                      decoration: InputDecoration(
                        labelText:'OPD Number.',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged:(val) {
                        setState(() {
                          globals.opdno=val.toString();
                          print('Blood Sugar Result='+val.toString());
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
                            MaterialPageRoute(builder: (context)=>RiskAssessment())
                        );
                      } else {
                        print("validation failed");
                      }
                    },
                  ),
                ],
              ),
            ),
          ) ,
        ),
      ),

    );
  }
}
