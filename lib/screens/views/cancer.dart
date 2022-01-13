import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:validate/expect.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/constants.dart';
import 'package:mpower/screens/awareness_home.dart';
import 'package:mpower/database.dart';
import 'package:intl/intl.dart';

class Cancer extends StatefulWidget {
  const Cancer({Key? key}) : super(key: key);

  @override
  _CancerState createState() => _CancerState();
}

class _CancerState extends State<Cancer> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _contentStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal);
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  TextEditingController totalMaleCancer = TextEditingController();
  TextEditingController totalFemaleCancer = TextEditingController();
  TextEditingController totalDisabledCancer = TextEditingController();

  void submit() async{
   // print(globals.dbt1.toString());
    // var now=DateTime.now();
    var user= globals.loggedUser.toString();

    globals.totalMaleCancer=totalMaleCancer.text;
    globals.totalFemaleCancer=totalFemaleCancer.text;
    globals.totalDisabledCancer=totalDisabledCancer.text;

    DBProvider.addCancer(user,globals.bc1.toString(), globals.bc2.toString(), globals.bc3.toString(),
        globals.bc4.toString(),formatted,totalMaleCancer.text,totalFemaleCancer.text,totalDisabledCancer.text,globals.meetingID.toString());

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
          title: Text("Breast Cancer"),
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
                  // autovalidateMode: AutovalidateMode(isTrue(expression)),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: <Widget>[
                      FormBuilderCheckbox(name: 'bc1',title: Text('What is breast cancer?',style: _contentStyle,),
                          onChanged:( val) {
                            setState(() {
                              globals.bc1=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'bc2',title: Text('What to do to find breast cancer early?'),
                          onChanged:( val) {
                            setState(() {
                              globals.bc2=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'bc3',title: Text('What to do to lower chances of getting breast cancer?'),
                          onChanged:( val) {
                            setState(() {
                              globals.bc3=val.toString();
                            });
                          }),
                      FormBuilderCheckbox(name: 'bc4',title: Text('Where to seek screening services?'),
                          onChanged:( val) {
                            setState(() {
                              globals.bc4=val.toString();
                            });
                          }),
                      SizedBox(height: 10.0,),
                      FormBuilderTextField(
                          name: 'totalMaleCancer',
                          controller: totalMaleCancer,
                          decoration: InputDecoration(
                            labelText:'Total Male Clients .',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            //hintText: 'NATIONAL ID'
                          ),
                          onChanged:(val) {
                            setState(() {
                              globals.height=val.toString();
                              //print('Cancer='+val.toString());
                            });
                          }
                      ),SizedBox(height: 10.0,),
                      FormBuilderTextField(
                          name: 'totalFemaleCancer',
                          controller: totalFemaleCancer,
                          decoration: InputDecoration(
                            labelText:'Total Female Clients .',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            //hintText: 'NATIONAL ID'
                          ),
                          onChanged:(val) {
                            setState(() {
                              globals.height=val.toString();
                              //print('Cancer='+val.toString());
                            });
                          }
                      ),SizedBox(height: 10.0,),
                      FormBuilderTextField(
                          name: 'totalDiabledCancer',
                          controller: totalDisabledCancer,
                          decoration: InputDecoration(
                            labelText:'Total Disabled Clients .',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            //hintText: 'NATIONAL ID'
                          ),
                          onChanged:(val) {
                            setState(() {
                              globals.totalDisabledCancer=val.toString();
                             // print('Cancer='+val.toString());
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
