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
List<BottomNavigationBarItem> _items ;
String _value = "";
int _index = 0;

String _updateButtonVal = "";
void _onNavBarUpdateButtonClicked(String _val)=>setState(()=>_updateButtonVal  = "Clicked on Button$_val");

void _showBottomSheet(){
  showModalBottomSheet<void>(context: context,
      builder: (BuildContext context){
         return new Container(
           padding: new EdgeInsets.all(15.0),
           child: new Column(
             children: <Widget>[
               new Text("Do You Want to Save ?"),
               new RaisedButton(onPressed: ()=>Navigator.pop(context),child: new Text("Yes "),),
               new RaisedButton(onPressed: ()=>Navigator.pop(context),child: new Text("No "),),
             ],
           ),
         );
      });
}

  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();
  void showSnackBar(){
    _scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text("This is Snack Bar")));
  }
  Future _showAlertDialog(BuildContext context , String  message)async{
        return showDialog(context: context,child:
        new AlertDialog(title: new Text(message),
        actions: <Widget>[
          new FlatButton(onPressed: ()=>Navigator.pop(context), child: new Text("Yes")),
          new FlatButton(onPressed: ()=>Navigator.pop(context), child: new Text("Cancel")),

        ],)
        );
  }
  @override
  void initState() {
    _items = new List();
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.people),title:new Text("People"),backgroundColor: Colors.lightBlue));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.person),title:new Text("Person"),backgroundColor: Colors.lightBlue));
    _items.add(new BottomNavigationBarItem(icon: new Icon(Icons.message),title:new Text("Messages"),backgroundColor: Colors.lightBlue));
  }




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key:_scaffoldState,
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
              new RaisedButton(onPressed: ()=>_onNavBarUpdateButtonClicked("Clicked Nav Bar Button"), child: new Text("Update"),),
              new RaisedButton(onPressed: ()=>Navigator.pop(context),child: new Text("Close"),)
              
            ],
          ),
        )
      ),
      persistentFooterButtons: <Widget>[
        makeFooterWidgets(),
      ],
      bottomNavigationBar: new BottomNavigationBar(items: _items,
      fixedColor: Colors.deepOrange,
      currentIndex: _index,
      onTap: (int item){
        setState(() {
          _index = item;
          _value = "Clicked on ${_index.toString()}";
        });
      },),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[

              new Text("Nav Bar +/- = $_val"),
              new Text("Floating Button CurrentDate:$_currentDate"),
              new Text("Clicked Footer Button $_clickedButton"),
              new Text("Selected Bottom Navigation Bar Items::$_value"),
              new Text("Clicked $_updateButtonVal"),
              new RaisedButton(onPressed: _showBottomSheet,child: new Text("Show BottomSheet"),),
              new RaisedButton(onPressed: showSnackBar,child: new Text("Click to show SnackBar"),),
              new RaisedButton(onPressed: ()=>_showAlertDialog(context, "Do You like the film ?"),child: new Text("Show Alert Dialog"),),

            ],
          ),
        ),
      ),
      
    );
  }

}

//Add a Drawer, in the Drawer add a button, when the button is clicked it should update a Text widget on the main page with the current date and time
