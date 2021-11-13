import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:mpower/main.dart';
import '../constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/diabetes.dart';
import 'views/hypertension.dart';
import 'views/diabetes_retinopathy.dart';
import 'views/anaemia.dart';
import 'views/epilepsy.dart';
import 'views/cancer.dart';


class AwarenessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awareness & Education',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AwarenessPage(),
    );
  }
}


class AwarenessPage extends StatelessWidget  {
  final _headerStyle = TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  final _loremIpsum =
  '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

   build(context) =>Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text('Awareness & Education'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
         // onPressed: () => Navigator.pop(context, false),
          onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>myMain())),
        ),
      ),
      body: Accordion(
        maxOpenSections: 1,
        headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        children: [
          AccordionSection(
            isOpen: true,
            leftIcon: Icon(Icons.insights_rounded, color: Colors.white),
            header: Text('Diabetes', style: _headerStyle),
            content: Diabetes(),
            contentHorizontalPadding: 20,
            contentBorderWidth: 1,
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: Icon(Icons.compare_rounded, color: Colors.white),
            header: Text('Hypertension', style: _headerStyle),
            contentBorderColor: Color(0xffffffff),
            content: Hypertension(),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: Icon(Icons.food_bank, color: Colors.white),
            header: Text('Sickle Cell Anaemia', style: _headerStyle),
            content: Anaemia(),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: Icon(Icons.contact_page, color: Colors.white),
            header: Text('Epilepsy', style: _headerStyle),
            content: Epilepsy(),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: Icon(Icons.computer, color: Colors.white),
            header: Text('Diabetes Retinophathy(For Patients Living with Diabetes)', style: _headerStyle),
            content: DiabetesRetinopathy(),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon: Icon(Icons.movie, color: Colors.white),
            header: Text('Breast Cancer', style: _headerStyle),
            content: Cancer(),
          ),
        ],
      ),
    );
  }




