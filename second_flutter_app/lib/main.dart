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
  String _value = "";
  void _onChanged(String value){
    setState(() {
      _value = "Changed::$value";
    });
  }

  void _onSubmitted(String value){
    setState(() {
      _value = "Submitted::$value";
    });
  }

  bool _value1 = false;
  bool _value2 = false;
  void _value1Changed(bool value) => setState(()=> _value1 = value);
  void _value2Changed(bool value) => setState(()=> _value2 = value);

  var _radioVal1 = 0;
  var _radioVal2  = 0;

  void _radioVal1Changed(int val)=> setState(()=> _radioVal1 = val);
  void _radioVal2Changed(int val)=> setState(()=> _radioVal2 = val);

  Widget makeRadios(){

    List list = new List<Widget>();

    for(int i=0; i<2;i++){
      list.add(new Radio(value: i, groupValue: _radioVal1, onChanged: _radioVal1Changed));

    }
    Column column = new Column(children: list,);
    return column;
  }

  Widget makeRadioTiles(){

    List list = new List<Widget>();

    for(int i=0; i<2;i++){
      list.add(new RadioListTile(value: i,
        groupValue: _radioVal2,
          onChanged: _radioVal2Changed,
        title: new Text("Item $i"),
        subtitle: new Text("subItem $i"),
        activeColor: Colors.orange,
        controlAffinity: ListTileControlAffinity.trailing,

      ),
      );

    }
    Column column = new Column(children: list,);
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Widget Demos"),

      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(_value),
              new TextField(
                decoration: new InputDecoration(
                  labelText: "Hello ",
                  hintText: "Enter Info",
                  icon: new Icon(Icons.people),
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onSubmitted: _onSubmitted,
                onChanged: _onChanged,
              ),
              new Checkbox(value: _value1, onChanged:_value1Changed, ),
              new CheckboxListTile(value: _value2,
                onChanged: _value2Changed,
                title: new Text("Friends"),
                activeColor: Colors.green,
                controlAffinity: ListTileControlAffinity.leading,
                secondary: new Icon(Icons.add_circle),
                subtitle: new Text("SubTitle"),

              ),
              makeRadios(),
              makeRadioTiles()
            ],
          ),
        ),
      ),
    );
  }

}


