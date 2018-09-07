import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomestring="";
  var x=Icons.lock;



  void _erase(){
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome(){
    setState(() {
      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty){
        _welcomestring = "Welcome, ${_userController.text}";
        x=Icons.lock_open;

      }else{
        _welcomestring = "Invalid Username or Password!";
        x=Icons.lock;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("User Login"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/face.png',
              width: 250.0,
              height: 250.0,
              color: Colors.green,
            ),
            //FORM
            new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: 'Username',
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(x),
                    ),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)),
                  new Center(
                    child: new Row(
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(left: 38.0) ,
                              child: new RaisedButton(
                        color: Colors.redAccent,
                    onPressed: _showWelcome,
                child: new Text(
                    'Login'
                ))),
          new Container(
            margin: const EdgeInsets.only(left: 110.0),
              child: new RaisedButton(
            color: Colors.redAccent,
            onPressed: _erase,
            child: new Text(
                'Clear'
            )))],
                  ))
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(10.5)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  _welcomestring,
                  style: new TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
