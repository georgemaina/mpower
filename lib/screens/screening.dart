import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpower/screens/globals.dart';
import 'package:mpower/screens/views/identifiers.dart';
import 'package:mpower/welcome.dart';
import 'views/enrollment.dart';
import 'views/blood_pressure.dart';
import 'views/bloodsugar.dart';
import 'views/identifiers.dart';
import 'views/risk_assessment.dart';
import 'views/treatment.dart';
import 'views/bmi.dart';
import 'views/referral.dart';
import 'main_screen.dart';
import '../constants.dart';

class ScreeningHome extends StatefulWidget {
  @override
  _ScreeningHomeState createState() => _ScreeningHomeState();
}

class _ScreeningHomeState extends State<ScreeningHome> {
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
          title: Text("Screening"),
          elevation: 2,
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
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 2.0),
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(3.0),
            children: <Widget>[
              makeDashboardItem("Enrollment", Icons.medical_services,Enrollment()),
              makeDashboardItem("Identifiers",Icons.shield,Identifiers()),
              makeDashboardItem("Risk Assessment", Icons.favorite,RiskAssessment()),
              makeDashboardItem("Current Treatment", Icons.health_and_safety,Treatment()),
              makeDashboardItem("Blood Pressure", Icons.health_and_safety,BloodPressure()),
              makeDashboardItem("Blood Sugar",Icons.medical_services,BloodSugar()),
              makeDashboardItem("BMI",Icons.medical_services,Bmi()),
              makeDashboardItem("Referral",Icons.medical_services,Referral())
            ],
          ),
        ),
      ),


    );
  }

  Card makeDashboardItem(String title, IconData icon,screen) {
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
                SizedBox(height: 20.0),
                Center(
                    child: Icon(
                      icon,
                      size: 40.0,
                      color: Colors.blueAccent,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                      new TextStyle(fontSize: 15.0, color: Colors.white,fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ));
  }
}
