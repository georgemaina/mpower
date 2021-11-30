import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/awareness_home.dart';
import 'package:mpower/database.dart';
import 'package:intl/intl.dart';

class Anaemia extends StatefulWidget {
  const Anaemia({Key? key}) : super(key: key);

  @override
  _AnaemiaState createState() => _AnaemiaState();
}

class _AnaemiaState extends State<Anaemia> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  TextEditingController totalanaemia = TextEditingController();

  void submit() async{
    print(globals.dbt1.toString());
    // var now=DateTime.now();
    var user= globals.loggedUser.toString();
    DBProvider.addAnaemia(user,globals.sca1.toString(), globals.sca2.toString(), globals.sca3.toString(),
        globals.sca4.toString(),globals.sca5.toString(),formatted,globals.totalanaemia.toString());

    Navigator.push(context, MaterialPageRoute(builder: (context)=>AwarenessDashboard()));
    final data=await DBProvider.countRecords();

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
          title: Text("Awareness and Education Review"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>AwarenessDashboard())
              );
            },
          ),
        ),
        body: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children:<Widget> [
                FormBuilder(
                  key: _formKey,
                  //autovalidateMode: true,
                  child: Column(
                    children: <Widget>[
                      FormBuilderCheckbox(name: 'sca1',title: Text('What is Sickle Cell Disease?',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.sca1=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'sca2',title: Text('Symptoms and complications of Sickle Cell Disease'
                        ,style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.sca2=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'sca3',title: Text('Diagnosis of Sickle Cell Disease'
                        ,style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.sca3=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'sca4',title: Text('Access to Treatment of Sickle Cell Disease'
                        ,style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.sca4=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'sca5',title: Text('Family Tree Counselling and Testing for Sickle Cell Disease'
                        ,style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.sca5=val.toString();
                            });
                          }),
                      FormBuilderTextField(
                          name: 'totalanaemia',
                          controller: totalanaemia,
                          decoration: InputDecoration(
                            labelText:'Total Clients .',
                            //hintText: 'NATIONAL ID'
                          ),
                          onChanged:(val) {
                            setState(() {
                              globals.height=val.toString();
                              print('anaemia='+val.toString());
                            });
                          }
                      ),
                      SizedBox(height: 10.0,),
                      Center(
                        child: ElevatedButton.icon(
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
                              this.submit();
                            } else {
                              print("validation failed");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      ),
      ),

    );
  }
}
