//@dart=2.9
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:mpower/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mpower/screens/views/blood_pressure.dart';
import 'package:mpower/screens/views/bloodsugar.dart';
import 'package:mpower/screens/views/bmi.dart';
import 'package:mpower/screens/views/enrollment.dart';
import 'package:mpower/screens/views/identifiers.dart';
import 'package:mpower/screens/views/referral.dart';
import 'package:mpower/screens/views/risk_assessment.dart';
import 'package:mpower/screens/views/treatment.dart';
import 'package:mpower/main.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:intl/intl.dart';


class Screening2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enrollment Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
        title: Text('Hypertension & Diabetes Screening'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>myMain())),
          ),
        ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              EnrollmentCard(), //Enrollment
              IdentifierCard(),  //Identifier
              Card3(),
              Card4(),
              Card5(),
              Card6(),
              Card7(),
              Card8(),


            ],
          ),
        ),
      ),
    );
  }
}

class EnrollmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(
                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                          )
                      ),
                      // color: Colors.indigoAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(child: Icon(Icons.insights_rounded,color: Colors.white)),
                                    TextSpan(
                                      text:"ENROLLMENT",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                    )
                                  ],

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Enrollment(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
class IdentifierCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      );
    }
    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(

                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(child: Icon(Icons.compare_rounded, color: Colors.white)),
                                      TextSpan(
                                        text:"IDENTIFIERS",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(color: Colors.white),
                                      )
                                    ],

                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Identifiers(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
class Card3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
        child: Text(label),
      );
    }

    buildList() {
      return Column(
        children: <Widget>[
          for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
        ],
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(

                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(child: Icon(Icons.computer, color: Colors.white)),
                                    TextSpan(
                                      text:"RISK ASSESSMENT",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                    )
                                  ],

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: RiskAssessment(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
class Card4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
        child: Text(label),
      );
    }

    buildList() {
      return Column(
        children: <Widget>[
          for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
        ],
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(

                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(child: Icon(Icons.contact_page, color: Colors.white)),
                                    TextSpan(
                                      text:"CURRENT TREATMENT",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                    )
                                  ],

                                ),
                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Treatment(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
class Card5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
        child: Text(label),
      );
    }

     return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(

                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(child: Icon(Icons.computer, color: Colors.white)),
                                    TextSpan(
                                      text:"BLOOD PRESSURE",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                    )
                                  ],

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: BloodPressure(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
class Card6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
        child: Text(label),
      );
    }

    buildList() {
      return Column(
        children: <Widget>[
          for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
        ],
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(

                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(child: Icon(Icons.movie, color: Colors.white)),
                                    TextSpan(
                                      text:"BLOOD SUGAR",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                    )
                                  ],

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: BloodSugar(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
class Card7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
        child: Text(label),
      );
    }

    buildList() {
      return Column(
        children: <Widget>[
          for (var i in [1, 2, 3, 4]) buildItem("Item ${i}"),
        ],
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(

                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(child: Icon(CupertinoIcons.refresh, color: Colors.white)),
                                    TextSpan(
                                      text:"BMI",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                    )
                                  ],

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Bmi(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
class Card8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildItem(String label) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(label),
      );
    }

    return ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,top:2,right: 10,bottom: 2),
          child: ScrollOnExpand(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ExpandablePanel(
                    theme: const ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToExpand: true,
                      tapBodyToCollapse: true,
                      hasIcon: false,
                    ),
                    header: Container(

                      decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomRight: const Radius.circular(10.0),
                            bottomLeft: const Radius.circular(10.0),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            ExpandableIcon(
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_right,
                                collapseIcon: Icons.arrow_drop_down,
                                iconColor: Colors.white,
                                iconSize: 28.0,
                                iconRotationAngle: math.pi / 2,
                                iconPadding: EdgeInsets.only(right: 5),
                                hasIcon: false,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(child: Icon(Icons.house, color: Colors.white)),
                                    TextSpan(
                                      text:"REFERRAL",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(color: Colors.white),
                                    )
                                  ],

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    collapsed: Container(),
                    expanded: Referral(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

