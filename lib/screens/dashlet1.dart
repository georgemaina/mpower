import 'package:flutter/material.dart';
import 'package:mpower/screens/globals.dart' as globals;


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("WELCOME BACK "+globals.loggedUser,
            style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Color(4282547648)),
          ),
          Text("YOU ARE LOGGED IN TO",
          style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
          ),
          Text( globals.mflcode +"-"+ globals.facility.toString(),
          style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Color(4282547648)),
          ),
          Padding(
            padding:EdgeInsets.symmetric(horizontal:1.0),
            child:Container(
              height:3.0,
              width:double.infinity,
              color:Colors.blue),),
          SizedBox(height: 10.0,),
          Text("PENDING TASKS: 0",
            style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color: Colors.white),
          ),
          ],
      ),
    );

  }
}