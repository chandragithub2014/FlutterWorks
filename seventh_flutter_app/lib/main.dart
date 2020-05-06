import 'package:flutter/material.dart';
//import 'package:sky_engine/_http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main(){
   runApp(new MaterialApp(
     home: new MyApp(),
   ));
}
class MyApp extends StatefulWidget{
  @override

  _State createState() => new _State();

}

class _State extends State<MyApp>{
  Map _countries = new Map();
  List pets  = ['Cat','Dog','Tiger','Parrot'];


  void _getCountries() async{
    var url = 'http://country.io/names.json';
    var response = await http.get(url);
    if(response.statusCode == 200){
      setState(() {
        _countries = json.decode(response.body);
        print("Loaded ${_countries.length} Countries");
      });
    }else{
      print("Response is ${response.statusCode}");
    }
  }

  @override
  void initState() {
    _getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Name Here"),

      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Hello Flutter"),
              new Expanded(child : new Image.asset('images/flutter.jpg')),
              new Expanded(child : new Image.network('http://voidrealms.com/images/smile.jpg')),
               new Text("List of Countries",style: new TextStyle(fontWeight: FontWeight.bold),),
              new Expanded(child: new ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (BuildContext  context, int index)
                  {
                    String _key = _countries.keys.elementAt(index);
                    return new Row(children: <Widget>[
                      new Text("$_key:"),
                      new Text("${_countries[_key]}"),

                    ],);
                  })),
              new Text("List of Pets",style: new TextStyle(fontWeight: FontWeight.bold),),
              new Expanded(child: new ListView.builder(
                  itemCount: pets.length,
                  itemBuilder: (BuildContext context, int index){
                   return new Text(pets.elementAt(index));
                  }))

            ],
          ),
        ),
      ),
    );
  }

}


