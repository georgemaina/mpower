import 'package:flutter/material.dart';
import 'package:mpower/database.dart';
import 'package:mpower/main.dart';
// import 'package:mpower/models/HealthWorkers.dart';
// import 'package:mpower/screens/views/referral.dart';

class ReviewData extends StatelessWidget {
  const ReviewData({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Workers',
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
  List<Map<String, dynamic>> _diabetesList = [];
  bool _isLoading = true;
  TextEditingController textController = new TextEditingController();
  //List<WorkersList> taskList = List;

  void _getDiabetes() async{
    final data=await DBProvider.getDiabetesData();
    setState(() {
      _diabetesList=data;
      _isLoading=false;
      print(_diabetesList.length);
      print(_diabetesList);
    });
  }

  @override
  void initState() {
    super.initState();
    _getDiabetes();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Awareness and Education Review"),
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
            itemCount: _diabetesList.length,
            itemBuilder: (context,index)=>Card(
              color: Colors.orange,
              margin: const EdgeInsets.all(15),
              child: ListTile(
                title: Text(_diabetesList[index]['chfID'].toString()),
                subtitle: Text(_diabetesList[index]['inputDate']),
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


