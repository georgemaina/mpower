import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/screening.dart';
import 'package:mpower/screens/views/bmi.dart';
import 'package:mpower/database.dart';
import 'package:intl/intl.dart';

class BloodSugar extends StatefulWidget {
  const BloodSugar({Key? key}) : super(key: key);

  @override
  _BloodSugarState createState() => _BloodSugarState();
}

class _BloodSugarState extends State<BloodSugar> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);
  bool isSwitched = false;

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
          title: Text("Blood Sugar"),
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
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child:  FormBuilder(
              key: _formKey,
              //autovalidateMode: true,
              child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        Flexible(
                          child:Container(
                            padding: EdgeInsets.only(top: 20),
                            alignment: Alignment.centerLeft,
                            child: Text('Do you want to Test Blood Sugar',style: TextStyle(fontSize: 13)),
                          ),
                        ),
                        Flexible(
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                globals.test_bs=value.toString();
                              });
                            },
                          ),
                        ),
                        ],
                      ),
                        Column(
                          children: [
                            Container(
                              child: FormBuilderTextField(
                                  name: 'lastmeal',
                                  decoration: InputDecoration(
                                    labelText:'How many hours since the client last Ate/Drunk anything but water?',
                                    // hintText: 'NATIONAL ID'
                                  ),
                                  onChanged:(val) {
                                    setState(() {
                                      globals.last_meal=val.toString();
                                      print('Time last meal or drink='+val.toString());
                                    });
                                  }
                              ),
                            ),
                            SizedBox(
                              child: FormBuilderTextField(
                                  name: 'bsresults',
                                  decoration: InputDecoration(
                                    labelText:'Blood Sugar Results.',
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged:(val) {
                                    setState(() {
                                      globals.bs_results=val.toString();
                                      print('Blood Sugar Result='+val.toString());
                                    });
                                  }
                              ),
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
                                      MaterialPageRoute(builder: (context)=>Bmi())
                                  );
                                } else {
                                  print("validation failed");
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    )
            ),
          ),
        ),
      );
  }
}
