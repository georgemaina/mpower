import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mpower/screens/globals.dart';
import 'package:mpower/welcome.dart';
import 'views/diabetes.dart';
import 'views/hypertension.dart';
import 'views/diabetes_retinopathy.dart';
import 'views/anaemia.dart';
import 'views/epilepsy.dart';
import 'views/cancer.dart';
import 'main_screen.dart';
import '../constants.dart';

class AwarenessDashboard extends StatefulWidget {
  @override
  _AwarenessDashboardState createState() => _AwarenessDashboardState();
}

class _AwarenessDashboardState extends State<AwarenessDashboard> {
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
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 2.0),
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(3.0),
            children: <Widget>[
              makeDashboardItem("Diabetes", Icons.medical_services,Diabetes()),
              makeDashboardItem("Hypertension",Icons.shield,Hypertension()),
              makeDashboardItem("Sickle Cell Anaemia", Icons.favorite,Anaemia()),
              makeDashboardItem("Epilepsy", Icons.health_and_safety,Epilepsy()),
              makeDashboardItem("Diabetes Retinopathy", Icons.health_and_safety,DiabetesRetinopathy()),
              makeDashboardItem("Breast Cancer",Icons.medical_services,Cancer())
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
