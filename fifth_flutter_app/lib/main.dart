import 'package:flutter/material.dart';

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
  String _displayText = "";
  void onChanged(String  name) => setState(()=>_displayText = name) ;
  void onSubmitted(String  name) => setState(()=>_displayText = name) ;

  void onClick()=> setState(()=> showSnackBar(_displayText));

  void showSnackBar(String displayText){
    scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text(displayText)));
  }

  GlobalKey<ScaffoldState> scaffoldState = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldState,
      appBar: new AppBar(
        title: new Text("Name Here"),

      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Hello Flutter"),
              new TextField(
                decoration: new InputDecoration(
                labelText: "Name",
                hintText: "Enter Name",
                icon: new Icon(Icons.people),
              ),
                onChanged: onChanged,
                onSubmitted: onChanged,
              ),
              new RaisedButton(onPressed: onClick,child: new Text("ShowSnackBar"),),
            ],
          ),
        ),
      ),
    );
  }

}


