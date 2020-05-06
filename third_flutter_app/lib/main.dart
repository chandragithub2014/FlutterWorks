import 'package:flutter/material.dart';
import 'dart:async';

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
  bool _val1 = false;
  bool _val2 = false;
  void onSwitchChanged(bool val)=> setState(()=>_val1 = val);
  void onSwitchListTileChanged(bool val)=> setState(()=>_val2 = val);

  Widget makeSwitch(){
    List list  = new List<Widget>();
     list.add(new Switch(value: _val1, onChanged: onSwitchChanged));
    Column column  = new Column(children: list,);
    return column;
  }

  Widget makeSwitchTile(){
    List list = new List<Widget>();
    list.add(new SwitchListTile(value: _val2,
        onChanged: onSwitchListTileChanged,
    title: new Text("Gender",
    style: new TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.amberAccent
    ),),),);
    Column column  = new Column(children: list,);
    return column;
  }

  double _slideVal = 0.0;
  void _slideChanged(double val)=> setState(()=> _slideVal = val);
  Widget makeSliderWidget(){
     List list = new List<Widget>();
     list.add(new Text("Slider value is ${(_slideVal*100).round()}"));
     list.add(new Slider(value: _slideVal, onChanged: _slideChanged));
     list.add(new Text("Date Pickeed is $_dateVal"));
     list.add(new RaisedButton.icon(onPressed: _onDateChanged, icon: new Icon(Icons.date_range), label: new Text("PickDate")));
     Column column = new Column(children: list);
     return column;
  }
  String _dateVal = "";
  Future _onDateChanged() async{
    DateTime picked = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2021));
    if(picked !=null){
      setState(() {
        _dateVal = picked.toString();
      });
    }
  }

  String _changedVal = "";
  void _onChanged(String val ) => setState(()=> _changedVal = val);
  void _onSubmitted(String val ) => setState(()=> _changedVal = val);
  String _displayVal = "";
  void _onButtonClick()=>setState(()=> _displayVal = _changedVal);

  Widget makeInputWidget(){
    List list = new List<Widget>();
    list.add(new Text("Value from TextField $_displayVal"));
    list.add(new TextField(
      decoration: new InputDecoration(
        labelText: "Input",
        hintText: "Enter Info",
        icon: new Icon(Icons.person),
      ),
      keyboardType: TextInputType.text,
      onChanged: _onChanged,
      onSubmitted: _onSubmitted,
    ));
    list.add(new RaisedButton(onPressed: _onButtonClick,child: new Text("Click"),));

   Column column = new Column(children: list,);
   return column;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Switches"),

      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Hello Flutter"),
              makeSwitch(),
              makeSwitchTile(),
              makeSliderWidget(),
              makeInputWidget(),
            ],
          ),
        ),
      ),
    );
  }

}


