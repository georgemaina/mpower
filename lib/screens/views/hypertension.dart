import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/awareness_home.dart';
import 'package:mpower/database.dart';
import 'package:intl/intl.dart';

class Hypertension extends StatefulWidget {
  const Hypertension({Key? key}) : super(key: key);

  @override
  _HypertensionState createState() => _HypertensionState();
}

class _HypertensionState extends State<Hypertension> {
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  TextEditingController totalMaleHypertension = TextEditingController();
  TextEditingController totalFemaleHypertension = TextEditingController();
  TextEditingController totalDisabledHypertension = TextEditingController();

  void submit() async{
    print(globals.dbt1.toString());

    globals.totalMaleHypertension=totalMaleHypertension.text;
    globals.totalFemaleHypertension=totalFemaleHypertension.text;
    globals.totalDisabledHypertension=totalDisabledHypertension.text;
    // var now=DateTime.now();
    var user= globals.loggedUser.toString();
    DBProvider.addHypertension(user,globals.bp1.toString(), globals.bp2.toString(), globals.bp3.toString(), globals.bp4.toString(),
        globals.bp5.toString(), globals.bp6.toString(), globals.bp7.toString(), globals.bp8.toString(),
        globals.bp9.toString(), globals.bp10.toString(),formatted,totalMaleHypertension.text,
        totalFemaleHypertension.text,totalDisabledHypertension.text);

    Navigator.push(context, MaterialPageRoute(builder: (context)=>AwarenessDashboard()));

  }

  final _formKey = GlobalKey<FormBuilderState>();
  Map appData = Map<String,dynamic>();
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
          title: Text("Hypertension"),
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
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children:<Widget> [
                FormBuilder(
                  key: _formKey,
                  //autovalidateMode: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        child: FormBuilderCheckbox(name: 'bp1',title:Text('Understanding hypertension',style: _contentStyle,),
                            onChanged:( val) {
                              setState(() {
                                globals.bp1=val.toString();
                              });
                            }),
                      ),
                      SizedBox(
                        child: FormBuilderCheckbox(name: 'bp2',title:Text('Risk factors for hypertension',style: _contentStyle,),
                            onChanged:( val) {
                              setState(() {
                                globals.bp2=val.toString();
                              });
                            }),
                      ),
                      FormBuilderCheckbox(name: 'bp3',title:Text('Signs and symptoms of hypertension',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.bp3=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'bp4',title:Text('Understanding BP readings',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.bp4=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'bp5',title:Text('Controlling high blood pressure',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.bp5=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'bp6',title:Text('Healthy diet',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.bp6=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'bp7',title:Text('Physical activity',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.bp7=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'bp8',title:Text('Treatment of high blood pressure',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.bp8=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'bp9',title:Text('Complications of high blood pressure',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.bp9=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'bp10',title:Text('Side effects of blood pressure medication',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.bp10=val.toString();
                            });
                          }),
                      FormBuilderTextField(
                          name: 'totalMaleHypertension',
                          controller: totalMaleHypertension,
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
                          name: 'totalFemaleHypertension',
                          controller: totalFemaleHypertension,
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
                          name: 'totalDisabledHypertension',
                          controller: totalDisabledHypertension,
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
