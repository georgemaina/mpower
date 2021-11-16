import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
// import 'package:mpower/login.dart';
import 'package:mpower/main.dart';
// import '../constants.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'views/enrollment.dart';
import 'views/identifiers.dart';
import 'views/risk_assessment.dart';
import 'views/treatment.dart';
import 'views/blood_pressure.dart';
import 'views/bloodsugar.dart';
import 'views/bmi.dart';
import 'views/referral.dart';
// import 'package:provider/provider.dart';
// import 'package:mpower/controllers/MenuController.dart';
// import 'package:mpower/screens/main_screen.dart';

class ScreeningApp extends StatefulWidget {
  const ScreeningApp({Key? key}) : super(key: key);

  @override
  _ScreeningAppState createState() => _ScreeningAppState();
}

class _ScreeningAppState extends State<ScreeningApp> {
  final _headerStyle = TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  // final _contentStyleHeader = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  // final _contentStyle = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  // final _loremIpsum =
  // '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screening',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Hypertension & Diabetes Screening'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>myMain())),

          ),
        ),
        body: Container(
          child: Accordion(
            maxOpenSections: 1,
            headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            children: [
              AccordionSection(
                isOpen: true,
                leftIcon: Icon(Icons.insights_rounded, color: Colors.white),
                header: Text('ENROLLMENT', style: _headerStyle),
                content: Enrollment(),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
              ),
              AccordionSection(
                isOpen: false,
                leftIcon: Icon(Icons.compare_rounded, color: Colors.white),
                header: Text('IDENTIFIERS', style: _headerStyle),
                contentBorderColor: Color(0xffffffff),
                content: Identifiers(),
              ),
              AccordionSection(
                isOpen: false,
                leftIcon: Icon(Icons.food_bank, color: Colors.white),
                header: Text('RISK ASSESSMENT', style: _headerStyle),
                content: RiskAssessment(),
              ),
              AccordionSection(
                isOpen: false,
                leftIcon: Icon(Icons.contact_page, color: Colors.white),
                header: Text('CURRENT TREATMENT', style: _headerStyle),
                content: Treatment(),
              ),
              AccordionSection(
                isOpen: false,
                leftIcon: Icon(Icons.computer, color: Colors.white),
                header: Text('BLOOD PRESSURE)', style: _headerStyle),
                content: BloodPressure(),
              ),
              AccordionSection(
                isOpen: false,
                leftIcon: Icon(Icons.movie, color: Colors.white),
                header: Text('BLOOD SUGAR', style: _headerStyle),
                content: BloodSugar(),
              ),
              AccordionSection(
                isOpen: false,
                leftIcon: Icon(Icons.movie, color: Colors.white),
                header: Text('BMI', style: _headerStyle),
                content: Bmi(),
              ),
              AccordionSection(
                isOpen: false,
                leftIcon: Icon(Icons.movie, color: Colors.white),
                header: Text('REFERRAL', style: _headerStyle),
                content: Referral(),
              ),
            ],
          ),
        ),

      ),
    );
  }
}





