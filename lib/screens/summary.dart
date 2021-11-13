import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

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
          Text("CLIENTS SCREENED",
            style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
          ),
          Text("PRE-HYPERTENSIVE",
            style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
          ),
          Text("HYPERTENSIVE",
            style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
          ),
          SizedBox(height: 10.0,),
          Text("DIABETES",
            style:TextStyle(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.red),
          ),
          Text("CLIENTS SCREENED",
            style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
          ),
          Text("PRE-DIABETIC",
            style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
          ),
          Text("DIABETIC",
            style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
          ),
        ],
      ),
    );

  }
}