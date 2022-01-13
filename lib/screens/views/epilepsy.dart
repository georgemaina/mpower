import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/awareness_home.dart';
import 'package:mpower/database.dart';
import 'package:intl/intl.dart';


class Epilepsy extends StatefulWidget {
  const Epilepsy({Key? key}) : super(key: key);

  @override
  _EpilepsyState createState() => _EpilepsyState();
}

class _EpilepsyState extends State<Epilepsy> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  TextEditingController totalMaleEpilepsy = TextEditingController();
  TextEditingController totalFemaleEpilepsy = TextEditingController();
  TextEditingController totalDisabledEpilepsy = TextEditingController();


  void submit() async{
    print(globals.dbt1.toString());
    // var now=DateTime.now();
    var user= globals.loggedUser.toString();
    globals.totalMaleEpilepsy=totalMaleEpilepsy.text;
    globals.totalFemaleEpilepsy=totalFemaleEpilepsy.text;
    globals.totalDisabledEpilepsy=totalDisabledEpilepsy.text;

    DBProvider.addEpilepsy(user,globals.epy1.toString(), globals.epy2.toString(), globals.epy3.toString(),
        globals.epy4.toString(),formatted,totalMaleEpilepsy.text,totalFemaleEpilepsy.text,totalDisabledEpilepsy.text,globals.meetingID.toString());

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
          title: Text("Epilepsy"),
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
                      FormBuilderCheckbox(name: 'epy1', title:Text('Definition and presentation of Epilepsy',style: _contentStyle),
                          onChanged:(val) {
                            setState(() {
                              globals.epy1=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'epy2',title: Text('Causes, myths and misconceptions of Epilepsy',style: _contentStyle),
                          onChanged:(val) {
                            setState(() {
                              globals.bc2=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'epy3',title: Text('How to live positively with Epilepsy',style: _contentStyle),
                          onChanged:(val) {
                            setState(() {
                              globals.bc3=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'epy4',title: Text('How to support someone having an Epileptic seizure',style: _contentStyle),
                          onChanged:(val) {
                            setState(() {
                              globals.bc4=val.toString();
                            });
                          }),
                      FormBuilderTextField(
                          name: 'totalMaleEpilepsy',
                          controller: totalMaleEpilepsy,
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
                              print('hypertension='+val.toString());
                            });
                          }
                      ),
                      SizedBox(height: 10.0,),
                      FormBuilderTextField(
                          name: 'totalFemaleEpilepsy',
                          controller: totalFemaleEpilepsy,
                          decoration: InputDecoration(
                            labelText:'Total Female Clients Reached .',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            //hintText: 'NATIONAL ID'
                          ),
                          onChanged:(val) {
                            setState(() {
                              globals.height=val.toString();
                              print('Cancer='+val.toString());
                            });
                          }
                      ),SizedBox(height: 10.0,),
                      FormBuilderTextField(
                          name: 'totalDisabledEpilepsy',
                          controller: totalDisabledEpilepsy,
                          decoration: InputDecoration(
                            labelText:'Total Disabled Clients Reached.',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            //hintText: 'NATIONAL ID'
                          ),
                          onChanged:(val) {
                            setState(() {
                              globals.height=val.toString();
                              print('Cancer='+val.toString());
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
