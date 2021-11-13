import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("READY FOR UPLOAD: 0",
            style:TextStyle(fontSize: 16,fontWeight:FontWeight.bold ,color: Colors.blue),
          ),
        ],
      ),
    );

  }
}