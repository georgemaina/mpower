import 'package:flutter/material.dart';
import 'package:mpower/database.dart';
import 'package:mpower/welcome.dart';
import 'package:mpower/welcome.dart';
// import 'package:mpower/screens/views/referral.dart';

class Enrollments extends StatelessWidget {
  const Enrollments({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enrollments',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> _workers = [];
  bool _isLoading = true;
  TextEditingController textController = new TextEditingController();
  //List<WorkersList> taskList = List;

  void _getWorkers() async{
    final data=await DBProvider.getEnrollment();
    setState(() {
      _workers=data;
      _isLoading=false;
      print(_workers.length);
      print(_workers);
    });
  }

  @override
  void initState() {
    super.initState();
    _getWorkers();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Enrollments List"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>myMain())
              );
            },
          ),

        ),
        body: _isLoading
            ? const Center(
          child: CircularProgressIndicator(),
        )
            :ListView.builder(
            itemCount: _workers.length,
            itemBuilder: (context,index)=>Card(
              color: Colors.orange,
              margin: const EdgeInsets.all(15),
              child: ListTile(
                title: Text(_workers[index]['firstname']+" "+_workers[index]['firstname']+" "+_workers[index]['dob']),
                isThreeLine: true,
                subtitle: Text(_workers[index]['phone']+": Hypertensive: "+_workers[index]['hypertensive']+": Diabetic: "+_workers[index]['diabetic']),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        icon:const Icon(Icons.edit) ,
                        onPressed: (){},
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: (){},
                      ),
                    ],
                  ),
                ),
              ),
            ))

    );
  }
}


