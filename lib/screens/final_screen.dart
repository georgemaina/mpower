import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mpower/models/awareness.dart';
import 'package:mpower/database.dart';
import 'dart:async';
import 'globals.dart' as globals;
import 'package:mpower/models/awareness.dart';


class FinalScreen extends StatefulWidget {
  const FinalScreen({Key? key}) : super(key: key);
  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {

  bool _isLoading = true;
  List<Awareness> awarenessFinal=[];
  var _diabetesList=[];
  var diabetesFinalList=[];
  var meetingID="520220122114030";
  var diabValues=new Map();
  var allAwareness;

  Future<List<Map<String, dynamic>>> getAwarenessList(String meetingID,String tableName) async{
    final db = await DBProvider.db();
    final data = await db.query(tableName , where: "meetingID = ?", whereArgs: [meetingID], limit: 1 );

    return data;
  }

  @override
  void initState() {
    super.initState();
    getSavedAwareness(meetingID,"diabetes",globals.diabetesObj);
    getSavedAwareness(meetingID,"hypertension",globals.hypertensionObj);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final allAwareness = awarenessFinal.map((e) {
      final awareness = e.names.toString();
      var awarenessValue;
      if(e.value.toString()!=''){
        awarenessValue="Yes";
      }else{
        awarenessValue='No';
      }
      return Padding(
        padding:EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Text(
              awareness +": "+awarenessValue,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Awareness Final Data"),
      ),
      body:SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            ...allAwareness,
          ],
        ),
      ),

    );
  }


   getSavedAwareness(String meetingID,String tableName,tableObj) async {
     setState(() {
       Future<List<Map<String, dynamic>>> awarenessList = getAwarenessList(
           meetingID, tableName);

       awarenessList.then((awareness) {
         for (var i = 0; i < awareness.length; i++) {
           diabValues = awareness[i];
         }
         diabValues.forEach((key, value) {
           var names = key;
           var values = value;
           tableObj.forEach((key, value) {
             if (names == key) {
               print(value +":"+values);
               Awareness awareness = Awareness(names: value, value: values);
               awarenessFinal.add(awareness);
             }
           });
         });
         //print(awarenessFinal);
       });
     });
   }



}

