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
  int _val = 0;
  void _add()=> setState(()=> _val++);
  void _subt()=> setState(()=> _val--);
  String _currentDate = "";
  void _onFloatingButtonClicked()=>setState(()=>_currentDate = new DateTime.now().toString());


  Widget makeAddSubWidgets(){
    List list = new List<Widget>();
    list.add(new IconButton(icon: new Icon(Icons.add), onPressed: _add));
    list.add(new IconButton(icon: new Icon(Icons.remove), onPressed: _subt));

   // Column col = new Column(children: list);
    Row row = new Row(children: list);
    return row;
  }
Widget makeFooterWidgets(){
    List list = new List<Widget>();
    list.add(new IconButton(icon: new Icon(Icons.person), onPressed: ()=>_onFooterButtonClicked('Button1')));
    list.add(new IconButton(icon: new Icon(Icons.people), onPressed: ()=>_onFooterButtonClicked('Button2')));
    list.add(new IconButton(icon: new Icon(Icons.timer), onPressed: ()=>_onFooterButtonClicked('Button3')));

    Row row = new Row(children: list,);
    return row;
}
String _clickedButton = "";
void _onFooterButtonClicked(String _val)=>setState(()=>_clickedButton=_val);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello AppBar",style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrangeAccent,
            fontSize: 22.0)),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          makeAddSubWidgets()

        ],

      ),
       floatingActionButton: new FloatingActionButton(
         onPressed: _onFloatingButtonClicked,
         backgroundColor: Colors.orange,
         mini: true ,elevation: 0.0,
         child: new Icon(Icons.timer),

       ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new Icon(Icons.people),
              new Text("Item1"),
              new RaisedButton(onPressed: ()=>Navigator.pop(context),child: new Text("Close"),)
              
            ],
          ),
        )
      ),
      persistentFooterButtons: <Widget>[
        makeFooterWidgets(),
      ],
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[

              new Text("$_val"),
              new Text("CurrentDate:$_currentDate"),
              new Text("Clicked Footer Button $_clickedButton")
            ],
          ),
        ),
      ),
    );
  }

}


