// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';
// import 'views/enrollment.dart';
// import 'views/identifiers.dart';
// import 'views/risk_assessment.dart';
// import 'views/treatment.dart';
// import 'views/blood_pressure.dart';
// import 'views/bloodsugar.dart';
// import 'views/bmi.dart';
// import 'views/referral.dart';
// import 'package:mpower/main.dart';
// import 'package:mpower/screens/views/health_workers.dart';
// import 'package:mpower/database.dart';
//
//
//
// class Screening extends StatelessWidget {
//   const Screening({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Hypertension & Diabetes Screening",
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue
//       ),
//       home:LoaderPage() ,
//     );
//   }
// }
//
// class LoaderPage extends StatefulWidget {
//   const LoaderPage({Key? key}) : super(key: key);
//
//   @override
//   _LoaderPageState createState() => _LoaderPageState();
// }
//
//
// class _LoaderPageState extends State<LoaderPage> {
//
//   final _headerStyle = TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
//    final _contentBolder = BorderRadius.only(
//        topLeft: Radius.circular(0),
//        topRight: Radius.circular(0),
//        bottomLeft: Radius.circular(15),
//        bottomRight: Radius.circular(15));
//    final _titleBorder=BorderRadius.only(
//        topLeft: Radius.circular(10),
//        topRight: Radius.circular(10),
//        bottomLeft: Radius.circular(10),
//        bottomRight: Radius.circular(10));
//   final formKey =new GlobalKey<FormState>();
//
//    submitForm(){
//     // First validate form.
//     // var firstname=enroll.currentState!.firstname.text;
//     // var lastname=enroll.currentState.lastname.text;
//     // var dob=enroll.currentState.dob.text;
//     // var sex=key.currentState!.se.text;
//
//     // DBProvider.enrollClient(firstname,lastname, dob, 'f');
//     // //this.registerDefaulter();
//     // Navigator.push(
//     //     context,
//     //     MaterialPageRoute(builder: (context)=>Workers())
//     // );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: GFAppBar(
//         title: Text('Hypertension & Diabetes Screening', style: TextStyle(fontSize: 18),),
//         backgroundColor: Colors.green,
//         centerTitle: false,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>myMain())),
//
//           ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         margin: EdgeInsets.only(left: 10, right: 10, top: 20, ),
//         child: ListView(
//           shrinkWrap: true,
//           scrollDirection: Axis.vertical,
//           physics: ScrollPhysics(),
//           children:<Widget>[
//             GFAccordion(
//               title:'ENROLLMENT',
//               contentChild: Enrollment(),
//               collapsedTitleBackgroundColor: Colors.blue,
//               expandedTitleBackgroundColor: Colors.blue,
//               contentBorder: Border.all(color: Colors.blue,),
//               contentBorderRadius:_contentBolder,
//               titleBorderRadius: _titleBorder,
//               contentPadding:EdgeInsets.all(10),
//               textStyle: _headerStyle,
//
//             ),
//             GFAccordion(
//               title: 'IDENTIFIERS',
//               contentChild: Identifiers(),
//               collapsedTitleBackgroundColor: Colors.blue,
//               expandedTitleBackgroundColor: Colors.blue,
//               contentBorder: Border.all(color: Colors.blue,),
//               contentBorderRadius:_contentBolder,
//               titleBorderRadius: _titleBorder,
//               contentPadding:EdgeInsets.all(10),
//               textStyle: _headerStyle,
//             ),
//             GFAccordion(
//               title: 'RISK ASSESSMENT',
//               contentChild: RiskAssessment(),
//               collapsedTitleBackgroundColor: Colors.blue,
//               expandedTitleBackgroundColor: Colors.blue,
//               contentBorder: Border.all(color: Colors.blue,),
//               contentBorderRadius:_contentBolder,
//               titleBorderRadius: _titleBorder,
//               contentPadding:EdgeInsets.all(10),
//               textStyle: _headerStyle,
//             ),
//             GFAccordion(
//               title: 'BLOOD PRESSURE',
//               contentChild: BloodPressure(),
//               collapsedTitleBackgroundColor: Colors.blue,
//               expandedTitleBackgroundColor: Colors.blue,
//               contentBorder: Border.all(color: Colors.blue,),
//               contentBorderRadius:_contentBolder,
//               titleBorderRadius: _titleBorder,
//               contentPadding:EdgeInsets.all(10),
//               textStyle: _headerStyle,
//             ),
//             GFAccordion(
//               title: 'BLOOD SUGAR',
//               contentChild: BloodSugar(),
//               collapsedTitleBackgroundColor: Colors.blue,
//               expandedTitleBackgroundColor: Colors.blue,
//               contentBorder: Border.all(color: Colors.blue,),
//               contentBorderRadius:_contentBolder,
//               titleBorderRadius: _titleBorder,
//               contentPadding:EdgeInsets.all(10),
//               textStyle: _headerStyle,
//
//             ),
//             GFAccordion(
//                 title: 'BMI',
//                 contentChild: Bmi(),
//               collapsedTitleBackgroundColor: Colors.blue,
//               expandedTitleBackgroundColor: Colors.blue,
//               contentBorder: Border.all(color: Colors.blue,),
//               contentBorderRadius:_contentBolder,
//               titleBorderRadius: _titleBorder,
//               contentPadding:EdgeInsets.all(10),
//               textStyle: _headerStyle,
//             ),
//             GFAccordion(
//               title: 'REFERRAL',
//               contentChild: Referral(),
//               collapsedTitleBackgroundColor: Colors.blue,
//               expandedTitleBackgroundColor: Colors.blue,
//               contentBorder: Border.all(color: Colors.blue,),
//               contentBorderRadius:_contentBolder,
//               titleBorderRadius: _titleBorder,
//               contentPadding:EdgeInsets.all(10),
//               textStyle: _headerStyle,
//             ),
//             ElevatedButton(
//               child: Text("Enroll Client"),
//               onPressed: this.submitForm(),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//                 shadowColor: Colors.blueGrey,
//                 elevation: 5,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
