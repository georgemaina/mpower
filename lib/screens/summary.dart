import 'package:flutter/material.dart';
import 'package:mpower/database.dart';
// import 'package:http/http.dart' as http;
// import 'package:mpower/screens/globals.dart' as globals;
import 'dart:convert';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  List<Map<String, dynamic>> _records = [];
  int totalRecords=0;

  void _getEnrollments() async{
    final data=await DBProvider.countEnrollments();

    setState(() {
      _records=data;
      totalRecords=_records.length;
      print(jsonEncode(_records));
    });
  }

  @override
  void initState() {
    super.initState();
    _getEnrollments();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("NOVEMBER SUMMARY",
            style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Color(4282547648)),
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
                child:Text("CLIENTS SCREENED",
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
                child:Text("PRE-HYPERTENSIVE",
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
                child:Text("HYPERTENSIVE",
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
                child:Text("CLIENTS SCREENED:",
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
                child:Text("PRE-DIABETIC",
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
                child:Text("DIABETIC",
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