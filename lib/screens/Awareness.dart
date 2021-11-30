import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:mpower/database.dart';
import 'package:mpower/welcome.dart';
// import '../constants.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'views/diabetes.dart';
import 'views/hypertension.dart';
import 'views/diabetes_retinopathy.dart';
import 'views/anaemia.dart';
import 'views/epilepsy.dart';
import 'views/cancer.dart';
import 'package:mpower/screens/globals.dart' as globals;
import 'package:intl/intl.dart';
import 'package:mpower/screens/views/review_data.dart';

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


class AwarenessPage extends StatefulWidget  {
  @override
  State<AwarenessPage> createState() => _AwarenessPageState();
}

class _AwarenessPageState extends State<AwarenessPage> {
  final _headerStyle = TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  // final _contentStyleHeader = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  // final _contentStyle = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  // final _loremIpsum =
  //'Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd H:m:s');
  final String formatted = formatter.format(now);

  List<Map<String, dynamic>> _listDiabetes = [];

  void submit() async{
    print(globals.dbt1.toString());
    // var now=DateTime.now();
    var user= globals.loggedUser.toString();
    DBProvider.addDiabetes(user,globals.dbt1.toString(), globals.dbt2.toString(), globals.dbt3.toString(), globals.dbt4.toString(),
        globals.dbt5.toString(), globals.dbt6.toString(), globals.dbt7.toString(), globals.dbt8.toString(),
        globals.dbt9.toString(), globals.dbt10.toString(),formatted,globals.totaldiabetes.toString());

    DBProvider.addHypertension(user,globals.bp1.toString(), globals.bp2.toString(), globals.bp3.toString(), globals.bp4.toString(),
        globals.bp5.toString(), globals.bp6.toString(), globals.bp7.toString(), globals.bp8.toString(),
        globals.bp9.toString(), globals.bp10.toString(),formatted,globals.totalhypertension.toString());

    DBProvider.addAnaemia(user,globals.sca1.toString(), globals.sca2.toString(), globals.sca3.toString(),
          globals.sca4.toString(),globals.sca5.toString(),formatted,globals.totalanaemia.toString());

    DBProvider.addEpilepsy(user,globals.epy1.toString(), globals.epy2.toString(), globals.epy3.toString(),
        globals.epy4.toString(),formatted,globals.totalepilepsy.toString());

    DBProvider.addRetinopathy(user,globals.dr1.toString(), globals.dr2.toString(), globals.dr3.toString(),
        globals.dr4.toString(),globals.dr5.toString(),formatted,globals.totalretinopathy.toString());

    DBProvider.addCancer(user,globals.bc1.toString(), globals.bc2.toString(), globals.bc3.toString(),
        globals.bc4.toString(),formatted,globals.totalcancer.toString());

    Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewData()));

    final data=await DBProvider.countRecords();
    setState(() {
      _listDiabetes=data;
      print(_listDiabetes.length);
    });
  }

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
      body: SingleChildScrollView(
        child:Column(
          children: [
            Accordion(
                maxOpenSections: 1,
                headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                children: [
                  AccordionSection(
                    isOpen: false,
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
            Container(
              // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  this.submit();
                },
                child: const Text('SAVE AWARENESS'),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(250, 50), primary: Colors.deepOrange),
              ),),
          ],
        ),
      ),

    );
}




