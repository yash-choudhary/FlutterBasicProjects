import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  final String title;

  Home({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: new Text(title),
      ),
      body: new Center(
        child: new customButton()
      ),
    );
  }

}

class customButton  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(

      onTap: (){
        final snackbar = new SnackBar(content: new Text("Hello Gestures!"),
          backgroundColor: Theme.of(context).backgroundColor,
        duration: Duration(milliseconds: 2000),
        action: SnackBarAction(label: "OK", onPressed: ()=>null),);
        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: new Container(
        padding: new EdgeInsets.all(15.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: new Text("FIRST BUTTON!"),
      )

    );
  }
}