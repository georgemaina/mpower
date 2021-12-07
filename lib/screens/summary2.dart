import 'package:flutter/material.dart';
import 'package:mpower/database.dart';
import 'dart:convert';
import 'package:mpower/screens/register.dart';

import 'package:mpower/screens/awareness_home.dart';

class Summary2 extends StatefulWidget {
  const Summary2({Key? key}) : super(key: key);

  @override
  State<Summary2> createState() => _Summary2State();
}

class _Summary2State extends State<Summary2> {
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
      // padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Flexible(
                child: Text("AWARENESS & EDUCATION SUMMARY",
                  style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Colors.red),
                ),
              ),
              Flexible(
                child:    FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Register()));
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child:Text("Diabetes Clients",
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
                child:Text("Hypertension Clients",
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
                child:Text("Sickle Cell Anaemia:",
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
                child:Text("Epilepsty",
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
                child:Text("Diabetes Retinopathy",
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
                child:Text("Breast Cancer",
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