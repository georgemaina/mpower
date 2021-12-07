import 'package:flutter/material.dart';
import 'package:mpower/database.dart';
import 'package:http/http.dart' as http;
import 'package:mpower/screens/globals.dart' as globals;
// import 'package:mpower/screens/views/health_workers.dart';
import 'dart:convert';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  List<Map<String, dynamic>> _records = [];
  int totalRecords=0;

  void uploadHealthWorkers() async{
    final bpdata=await DBProvider.getWorkers();
    String url = globals.url.toString() + "uploadHealthWorkers";
    var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:jsonEncode(bpdata)
    );
    print(response.body);

    var data=jsonDecode(response.body);
    // print(data);

    if(data=="Error"){
      print('Could not Add Health Workers');
    }else{
      print('Successfully Added Health Workers');
    }
  }

  void uploadEnrollment() async{
    final bpdata=await DBProvider.getEnrollment();
    String url = globals.url.toString() + "uploadEnrollment";
    var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:jsonEncode(bpdata)
    );
   print(url);

    var data=jsonDecode(response.body);
    if(data=="Error"){
      print('Could not Add Enrollment');
    }else{
      print('Successfully Added Enrollment Data');
    }
  }

  void uploadCancer() async{
    final bpdata=await DBProvider.getCancerData();
    String url = globals.url.toString() + "uploadCancer";
    var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:jsonEncode(bpdata)
    );

    var data=jsonDecode(response.body);
    if(data=="Error"){
      print('Could not Add Cancer');
    }else{
      print('Successfully Added Cancer Data');
    }
  }

  void uploadRetinopathy() async{
    final bpdata=await DBProvider.getRetinopathyData();
    String url = globals.url.toString() + "uploadRetinopathy";
    var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:jsonEncode(bpdata)
    );

    var data=jsonDecode(response.body);
    if(data=="Error"){
      print('Could not Add Retinopathy');
    }else{
      print('Successfully Added Retinopathy Data');
    }
  }

  void uploadEpilepsy() async{
    final bpdata=await DBProvider.getEpilepsyData();
    String url = globals.url.toString() + "uploadEpilepsy";
    var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:jsonEncode(bpdata)
    );

    var data=jsonDecode(response.body);
    if(data=="Error"){
      print('Could not Add Epilepsy');
    }else{
      print('Successfully Added Epilepsy Data');
    }
  }

  void uploadAnaemia() async{
    final bpdata=await DBProvider.getAnaemiaData();
    String url = globals.url.toString() + "uploadAnamemia";
    var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:jsonEncode(bpdata)
    );

    var data=jsonDecode(response.body);
    if(data=="Error"){
      print('Could not Add Anaemia');
    }else{
      print('Successfully Added Anaemia Data');

    }
  }

  void uploadHypertensionData() async{
    final bpdata=await DBProvider.getHypertensionData();
    String url = globals.url.toString() + "uploadHypertension";
    var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:jsonEncode(bpdata)
    );

    var data=jsonDecode(response.body);
    if(data=="Error"){
      print('Could not Add Hypertension');
    }else{
      print('Successfully Added Hypertension Data');
    }
  }

  void uploadDiabetes() async{
    final workers=await DBProvider.getDiabetesData();
    String url = globals.url.toString() + "uploadDiabetes";
    var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body:jsonEncode(workers)
    );

    var data=jsonDecode(response.body);
    print(data);
    if(data=="Error"){
      // Scaffold.of(context).showSnackBar(SnackBar(
      print('Could not Add uploadDiabetes');
      // ));
    }else{
      print('Successfully Added uploadDiabetes');

    }
  }

  void _getWorkers() async{
    final data=await DBProvider.countRecords();

    setState(() {
      _records=data;
      totalRecords=_records.length;
      // print(jsonEncode(_records));
    });
  }

  static Future<int> deleteRows() async {
    final db = await DBProvider.db();

    db.execute("Delete from enrollments");
    db.execute("Delete from diabetes");
    db.execute("Delete from hypertension");
    db.execute("Delete from anaemia");
    db.execute("Delete from epilepsy");
    db.execute("Delete from cancer");

    return 1;
  }


  @override
  void initState() {
    super.initState();
    _getWorkers();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Flexible(
            child:Text("READY TO UPLOAD : $totalRecords Records",
              style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Colors.yellow),
            )
          ),
          Flexible(
            child: IconButton(
              icon:Icon(Icons.upload),
                iconSize: 35,
                color: Colors.white,
                tooltip: 'Upload Records',
                onPressed:(){
                    setState(() {
                      _getWorkers();
                      uploadDiabetes();
                      uploadHypertensionData();
                      uploadAnaemia();
                      uploadEpilepsy();
                      uploadRetinopathy();
                      uploadCancer();
                      uploadHealthWorkers();
                      uploadEnrollment();
                      deleteRows();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Workers()));
                    });
                }

            ),
          )
        ],
    );

  }
}