import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mpower/screens/globals.dart' as globals;

//import http package manually

class SearchBar extends StatefulWidget{
  @override
  State createState() {
    return _SearchBar();
  }
}

class _SearchBar extends State{
  var bool;
  var searching;
  var error;
  var data;
  String query="";
  String dataurl = globals.url.toString() + "getFacilities";
  // do not use http://localhost/ , Android emulator do not recognize localhost
  // insted use your local ip address or your live URL
  // hit "ipconfig" on Windows or "ip a" on Linux to get IP Address

  @override
  void initState() {
    searching = false;
    error = false;
    query = "";
    super.initState();
  }

  void getSuggestion() async{  //get suggestion function
    var res = await http.post(Uri.parse(dataurl + "&query=" + Uri.encodeComponent(query)));
    //in query there might be unwant character so, we encode the query to url
    if (res.statusCode == 200) {
      setState(() {
        data = json.decode(res.body);
        //update data value and UI
      });
    }else{
      //there is error
      setState(() {
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          children: [
            Container(
              child:searchField(),
            ),
            Container(
              child: SingleChildScrollView(
                  child:Container(
                      alignment: Alignment.center,
                      child:data == null?
                      Container(
                          padding: EdgeInsets.all(20),
                          child: searching?Text("Please wait")
                              :Text("Search any facility")
                        //if is searching then show "Please wait"
                        //else show search peopels text
                      ):
                      Container(
                        child: searching?showSearchSuggestions()
                            :Text("Find any Facility"),
                      )
                    // if data is null or not retrived then
                    // show message, else show suggestion
                  )
              ),
            )
          ],
        )
      )


    );
  }

  Widget showSearchSuggestions(){
    List suggestionlist = List.from(
        data["data"].map((i){
          return SearchSuggestion.fromJSON(i);
        })
    );
    //serilizing json data inside model list.
    return Column(
      children:suggestionlist.map((suggestion){
        return Container(
            width:double.infinity, //make 100% width
            child: SingleChildScrollView(
                  child:Card(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(suggestion.name, style: TextStyle(
                        fontSize:20, fontWeight:FontWeight.bold,
                      ),),
                    ),
                  )
              )
        );
      }).toList(),
    );
  }

  Widget searchField(){ //search input field
    return Container(
        child:TextField(
          autofocus: true,
          style: TextStyle(color:Colors.white, fontSize: 18),
          decoration:InputDecoration(
            hintStyle: TextStyle(color:Colors.white, fontSize: 18),
            hintText: "Search Facilities",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.white, width:2),
            ),//under line border, set OutlineInputBorder() for all side border
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:Colors.white, width:2),
            ), // focused border color
          ), //decoration for search input field
          onChanged: (value){
            query = value; //update the value of query
            getSuggestion(); //start to get suggestion
          },
        )
    );
  }
}


//serarch suggestion data model to serialize JSON data
class SearchSuggestion{
  String id, name;
  SearchSuggestion({required this.id, required this.name});

  factory SearchSuggestion.fromJSON(Map<String, dynamic> json){
    return SearchSuggestion(
      id: json["mflcode"],
      name: json["facilityname"],
    );
  }
}