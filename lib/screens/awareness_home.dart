import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:mpower/welcome.dart';
import 'views/diabetes.dart';
import 'views/hypertension.dart';
import 'views/diabetes_retinopathy.dart';
import 'views/anaemia.dart';
import 'views/epilepsy.dart';
import 'views/cancer.dart';
import 'main_screen.dart';
import '../constants.dart';
import 'final_screen.dart';

class AwarenessDashboard extends StatefulWidget {
  @override
  _AwarenessDashboardState createState() => _AwarenessDashboardState();
}

class _AwarenessDashboardState extends State<AwarenessDashboard> {

  var totalDiabetesMales=globals.totalMaleDiabetes;
  var totalDiabetesFemales=globals.totalFemaleDiabetes;
  var totalDiabetesDisabled=globals.totalDisabledDiabetes;

  submit() async {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme
            .of(context)
            .textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: bgColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Awareness and Education"),
          elevation: .1,
          backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>myMain())
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          child: Column(
              children: [
                Container(
                  child: new Text("CHW: "+globals.loggedUser.toString()+",  Meeting ID: "+globals.meetingID.toString(),
                  style:
                  new TextStyle(fontSize: 15.0, color: Colors.yellow,fontWeight: FontWeight.normal)),
                  ),
                GridView.count(
                          crossAxisCount: 2,
                          // childAspectRatio: (itemWidth / itemHeight),
                          shrinkWrap: true,
                          controller: new ScrollController(keepScrollOffset: true),
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(3.0),
                           children: <Widget>[
                             makeDashboardItem("Diabetes", Icons.medical_services,Diabetes(),
                                 'Total Male ${totalDiabetesMales.toString()}',
                                 'Total Female ${totalDiabetesFemales.toString()}',
                                 'Total Disabled ${totalDiabetesDisabled.toString()}'),
                             makeDashboardItem("Hypertension",Icons.shield,Hypertension(),
                                 'Total Male ${globals.totalMaleHypertension.toString()}',
                                 'Total Female ${globals.totalFemaleHypertension.toString()}',
                                 'Total Disabled ${globals.totalDisabledHypertension.toString()}'),
                             makeDashboardItem("Sickle Cell Anaemia", Icons.favorite,Anaemia(),
                                 'Total Male ${globals.totalMaleAnaemia.toString()}',
                                 'Total Female ${globals.totalFemaleAnaemia.toString()}',
                                 'Total Disabled ${globals.totalDisabledAnaemia.toString()}'),
                             makeDashboardItem("Epilepsy", Icons.health_and_safety,Epilepsy(),
                                 'Total Male ${globals.totalMaleEpilepsy.toString()}',
                                 'Total Female ${globals.totalFemaleEpilepsy.toString()}',
                                 'Total Disabled ${globals.totalDisabledEpilepsy.toString()}'),
                             makeDashboardItem("Diabetes Retinopathy", Icons.health_and_safety,DiabetesRetinopathy(),
                                 'Total Male ${globals.totalMaleRetinopathy.toString()}',
                                 'Total Female ${globals.totalFemaleRetinopathy.toString()}',
                                 'Total Disabled ${globals.totalDisabledRetinopathy.toString()}'),
                             makeDashboardItem("Breast Cancer",Icons.medical_services,Cancer(),
                                 'Total Male ${globals.totalMaleCancer.toString()}',
                                 'Total Female ${globals.totalFemaleCancer.toString()}',
                                 'Total Disabled ${globals.totalDisabledCancer.toString()}'),
                          ]
                          ),
                Container(
                  child:ElevatedButton.icon(
                    label: Text('Done'),
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => FinalScreen()));
                    },
                  ),
                )

              ],


            ),
        )
          ),
      );
  }

  Card makeDashboardItem(String title, IconData icon,screen,males,females,disabled) {
    return Card(
        elevation: 3.0,
        margin: new EdgeInsets.all(8.0),
          color:bgColor,
        child: Container(
          decoration: BoxDecoration(
            color:secondaryColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
          child: new InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>screen)
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 10.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueAccent,
                    )),
                SizedBox(height: 10.0),
                new Center(
                  child: new Text(title,
                      style:
                      new TextStyle(fontSize: 15.0, color: Colors.white,fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10.0),
                new Center(
                  child: new Text(males,
                      style:
                      new TextStyle(fontSize: 15.0, color: Colors.greenAccent,fontWeight: FontWeight.normal)),
                ),
                SizedBox(height: 10.0),
                new Center(
                  child: new Text(females,
                      style:
                      new TextStyle(fontSize: 15.0, color: Colors.cyanAccent,fontWeight: FontWeight.normal)),
                ),
                SizedBox(height: 10.0),
                new Center(
                  child: new Text(disabled,
                      style:
                      new TextStyle(fontSize: 15.0, color: Colors.yellow,fontWeight: FontWeight.normal)),
                )
              ],
            ),
          ),
        ));
  }
}
