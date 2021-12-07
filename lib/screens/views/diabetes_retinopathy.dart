import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/awareness_home.dart';
import 'package:mpower/database.dart';
import 'package:intl/intl.dart';

class DiabetesRetinopathy extends StatefulWidget {
  const DiabetesRetinopathy({Key? key}) : super(key: key);

  @override
  _DiabetesRetinopathyState createState() => _DiabetesRetinopathyState();
}

class _DiabetesRetinopathyState extends State<DiabetesRetinopathy> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  TextEditingController totalMaleRetinopathy = TextEditingController();
  TextEditingController totalFemaleRetinopathy = TextEditingController();
  TextEditingController totalDisabledRetinopathy = TextEditingController();

  void submit() async{
    print(globals.dbt1.toString());
    // var now=DateTime.now();
    globals.totalMaleRetinopathy=totalMaleRetinopathy.text;
    globals.totalFemaleRetinopathy=totalFemaleRetinopathy.text;
    globals.totalDisabledRetinopathy=totalDisabledRetinopathy.text;


    var user= globals.loggedUser.toString();

    DBProvider.addRetinopathy(user,globals.dr1.toString(), globals.dr2.toString(), globals.dr3.toString(),
        globals.dr4.toString(),globals.dr5.toString(),formatted,totalMaleRetinopathy.text,
        totalFemaleRetinopathy.text,totalDisabledRetinopathy.text);

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
          title: Text("Diabetes Retinopathy"),
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
                      FormBuilderCheckbox(name: 'dr1',title:Text('What is Diabetes Retinopathy?',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.dr1=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'dr2',title:Text('Types of Retinopathy',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.dr2=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'dr3',title:Text('Risk factors for developing Diabetes Retinopathy'
                        ,style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.dr3=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'dr4',title:Text('Risk factors for developing Diabetes Retinopathy',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.dr4=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'dr5',title:Text('Risk factors for developing Diabetes Retinopathy',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.dr5=val.toString();
                            });
                          }),
                      FormBuilderTextField(
                          name: 'totalMaleRetinopathy',
                          controller: totalMaleRetinopathy,
                          decoration: InputDecoration(
                            labelText:'Total Male Clients Reached.',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            //hintText: 'NATIONAL ID'
                          ),
                          onChanged:(val) {
                            setState(() {
                              globals.height=val.toString();
                              print('Retinopathy='+val.toString());
                            });
                          }
                      ),
                  SizedBox(height: 10.0,),
                      FormBuilderTextField(
                          name: 'totalFemaleRetinopathy',
                          controller: totalFemaleRetinopathy,
                          decoration: InputDecoration(
                            labelText:'Total Female Clients Reached.',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            //hintText: 'NATIONAL ID'
                          ),
                          onChanged:(val) {
                            setState(() {
                              globals.height=val.toString();
                              print('Retinopathy='+val.toString());
                            });
                          }
                      ),
                  SizedBox(height: 10.0,),
                      FormBuilderTextField(
                          name: 'totalDisabledRetinopathy',
                          controller: totalDisabledRetinopathy,
                          decoration: InputDecoration(
                            labelText:'Total Disabled Clients reached.',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            //hintText: 'NATIONAL ID'
                          ),
                          onChanged:(val) {
                            setState(() {
                              globals.height=val.toString();
                              print('Retinopathy='+val.toString());
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
