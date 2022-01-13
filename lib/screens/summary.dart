import 'package:flutter/material.dart';
import 'package:mpower/database.dart';
// import 'package:http/http.dart' as http;
import 'package:mpower/screens/globals.dart' as globals;
import 'dart:convert';
import 'screening.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  List<Map<String, dynamic>> _records = [];
  List<Map<String, dynamic>> _dbrecords = [];
  List<Map<String, dynamic>> _bprecords = [];
  List<Map<String, dynamic>> _screcords = [];
  List<Map<String, dynamic>> _eprecords = [];
  List<Map<String, dynamic>> _drrecords = [];
  List<Map<String, dynamic>> _bcrecords = [];
  int totalRecords=0;
  int totaldbRecords=0;
  int totalbpRecords=0;
  int totalscRecords=0;
  int totalepRecords=0;
  int totaldrRecords=0;
  int totalbcRecords=0;

  void _getEnrollments() async{
    final data=await DBProvider.countRecords();

    setState(() {
      _records=data;
      totalRecords=_records.length;
     // print(jsonEncode(_records));
    });
  }

  void _getDiabetes() async{
    final data=await DBProvider.getDiabetesData();
    //print("Diabetes data:"+jsonEncode(data));
    setState(() {
      _dbrecords=data;
      totaldbRecords=_records.length;
   //   print("Diabetes "+jsonEncode(_dbrecords));
    });
  }

  void _getHypertension() async{
    final data=await DBProvider.getHypertensionData();
    print("Hypertension data:"+jsonEncode(data));
    setState(() {
      _bprecords=data;
      totalbpRecords=_records.length;
     // print("Hypertension "+jsonEncode(_bprecords));
    });
  }

  void _getAnaemia() async{
    final data=await DBProvider.getAnaemiaData();
    print("Anaemia data:"+jsonEncode(data));
    setState(() {
      _screcords=data;
      totalscRecords=_records.length;
      //print("Anaemia "+jsonEncode(_screcords));
    });
  }

  void _getEpilepsy() async{
    final data=await DBProvider.getEpilepsyData();
    print("Epilepsy data:"+jsonEncode(data));
    setState(() {
      _eprecords=data;
      totalepRecords=_records.length;
      //print("Epilepsy "+jsonEncode(_eprecords));
    });
  }

  void _getRetinopathy() async{
    final data=await DBProvider.getRetinopathyData();
    print("Retinopathy data:"+jsonEncode(data));
    setState(() {
      _drrecords=data;
      totaldrRecords=_records.length;
      //print("Retinopathy "+jsonEncode(_drrecords));
    });
  }

  void _getCancerData() async{
    final data=await DBProvider.getCancerData();
    print("Cancer data:"+jsonEncode(data));
    setState(() {
      _bcrecords=data;
      totalbcRecords=_records.length;
      //print("Breast Cancer "+jsonEncode(_bcrecords));
    });
  }

  @override
  void initState() {
    super.initState();
    _getEnrollments();
    _getDiabetes();
    _getHypertension();
    _getAnaemia();
    _getEpilepsy();
    _getCancerData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text("SCREENING SUMMARY",
                  style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Colors.red),
                ),
              ),
              Flexible(
                child:    FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => ScreeningHome()));
                  },
                  child: const Icon(Icons.add),
                  backgroundColor: Colors.green,
                  mini: true,
                ),),
            ],
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding:EdgeInsets.symmetric(horizontal:1.0),
            child:Container(
                height:3.0,
                width:double.infinity,
                color:Colors.blue),),
           Text("HYPERTENSION",
            style:TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.red),
          ),
          Row(
            children: [
              Flexible(
                child:Text("Clients Screened",
                  style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
                ),
                ),
              Flexible(
                  child: Text(" : $totalRecords",
                style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Colors.yellow),
              ))
            ],
          ),
          Row(
            children: [
              Flexible(
                child:Text("Pre-Hypertensive",
                  style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
                ),
              ),
              Flexible(
                  child: Text(" : $totalRecords",
                    style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Colors.yellow),
                  ))
            ],
          ),

          Row(
            children: [
              Flexible(
                child:Text("Hypertensive",
                  style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
                ),
              ),
              Flexible(
                  child: Text(" : $totalRecords",
                    style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Colors.yellow),
                  ))
            ],
          ),
          Text("DIABETES",
            style:TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.red),
          ),
          Row(
            children: [
              Flexible(
                child:Text("Clients Screened:",
                  style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
                ),
              ),
              Flexible(
                  child: Text(" : $totalRecords",
                    style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Colors.yellow),
                  ))
            ],
          ),
          Row(
            children: [
              Flexible(
                child:Text("Pre-Diabetic",
                  style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
                ),
              ),
              Flexible(
                  child: Text(" : $totalRecords",
                    style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Colors.yellow),
                  ))
            ],
          ),
          Row(
            children: [
              Flexible(
                child:Text("Diabetic",
                  style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
                ),
              ),
              Flexible(
                  child: Text(" : $totalRecords",
                    style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Colors.yellow),
                  ))
            ],
          ),
        ],
      ),
    );

  }
}