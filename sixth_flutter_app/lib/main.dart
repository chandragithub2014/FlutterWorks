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
  TextEditingController _user = new TextEditingController();
  TextEditingController _pwd = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Name Here"),

      ),
      body: new Container(
        padding: new EdgeInsets.all(25.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Card(child: new Container(
                padding: new EdgeInsets.all(32.0),
                child: new Column(
                  children: <Widget>[
                    new Text("Welcome to the Flutter"),
                    new Text("User Login"),
                  ],
                ),
              ),),

              new Row(
                children: <Widget>[
                  new Text("User Name "),
                  new Expanded(child: new TextField(controller: _user,)),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Text("PassWord "),
                  new Expanded(child: new TextField(controller: _pwd, obscureText: true,)),
                ],
              ),
              new Padding(
                  padding: new EdgeInsets.all(25.0),
                child: new RaisedButton(onPressed: ()=> print("Login ${_user.text}"),child: new Text("Login"),),),

            ],

          ),
          
        ),
      ),
    );
  }

}


