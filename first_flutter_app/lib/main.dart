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
  String _myName  = "Welcome Flutter";
  void _changeNameOnClick(){
    setState(() {
      _myName = "John Boucher";
    });
  }
  String _value = "Hello Flutter !!!";
  var _count = 0;
  String _value1 = "Hello Change me on Click";
  String _currentDate = new DateTime.now().toString();
  String _value2 = "Current Date";

  String _labelChanged = "";
  void _onChanged(String value){
    setState(() {
      _labelChanged = "Changed::$value";
    });
  }
  void _onSubmitted(String value){
    setState(() {
      _labelChanged = "Submitted::$value";
    });
  }

  void _add(){
    setState(() {
      _count++;

    });
  }
  void _decrement(){
    setState(() {
      _count--;
    });
  }
  void _onFlatButtonClick(){
    setState(() {
      _value2 = _currentDate ;
    });
  }

  void onClick(String _value){

    setState(() {
      _value1 = _value;
    });
  }
  void onPressed(){
    setState(() {
      _value = "Hello Flutter !!!";
      _count++;
      _value = _value + _count.toString();

      //
      // _value = "Pressed Button";
    });
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
              new Text(_value),
              new  Text(_value1),
              new Text(_value2),
              new RaisedButton(onPressed: onPressed,child: new Text("Click Me")),
              new RaisedButton(onPressed: () => onClick("Changed on Click"),child:new Text("OnClick with Parameters")),
              new FlatButton(onPressed: _onFlatButtonClick, child: new Text("Flat Button")),
              new Text("Value is = $_count"),
              new IconButton(icon: new Icon(Icons.add), onPressed: _add),
              new IconButton(icon: new Icon(Icons.remove), onPressed: _decrement),
              new Text(_myName),
              new RaisedButton(onPressed: _changeNameOnClick,child: new Text("Click Me"),),
              new Text(_labelChanged),
              new TextField(
                decoration: new InputDecoration(
                    hintText: "Enter Info",
                    labelText: "Hello",
                    icon: new Icon(Icons.people)
                ),
                autocorrect: true,
                autofocus:true,
                keyboardType: TextInputType.text,
                onChanged: _onChanged,
                onSubmitted: _onSubmitted,
              ),


            ],
          ),
        ),
      ),
    );
  }

}