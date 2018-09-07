import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

final TextEditingController _ageController = new TextEditingController();
final TextEditingController _heightController = new TextEditingController();
final TextEditingController _weightController = new TextEditingController();
double bmi,height,weight;
String note="Pls Enter Details",bmiout="WELCOME!!";

Future<bool> _exitConfirm(){
return showDialog(
  context: context,
  builder: (context)=>AlertDialog(
    title: new Text("Do You Really Want To Exit?"),
    actions: <Widget>[
      FlatButton(
        child: new Text("Yes"),
        onPressed: ()=>Navigator.pop(context,true),
      ),
      FlatButton(
        child: new Text("No"),
        onPressed: ()=>Navigator.pop(context,false),
      ),
    ],
  )
);
}

void _calc(){
  setState(() {
    height = double.parse(_heightController.text)/3.28;
    weight = double.parse(_weightController.text);
bmi=weight/(height*height);
if(bmi>=30.0){note = "Obese";}
else if(bmi<18.5){note = "Under Weight";}
else if(bmi<30 && bmi>=25){note = "Over Weight";}
else if(bmi>=18.5 && bmi<25){note = "Normal Weight";}
bmiout = "Your BMI = ${bmi.toStringAsFixed(2)}";
  });
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _exitConfirm,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Body Mass Index'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        backgroundColor: Colors.pinkAccent.shade100,
        body: new Container(
          child: new ListView(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(10.0)),
              new Center(
                child: new Image.asset(
                  'images/bmilogo.png',
                  height: 90.0,
                  width: 200.0,
                ),
              ),
              new Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid,
                      width: 10.0,
                      color: Colors.lightBlue),
                  color: Colors.lightBlue,
                  shape: BoxShape.rectangle,
                ),
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        suffixText: 'Years',
                        labelStyle: new TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        border: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.red
                            )
                        ),
                        icon: new Icon(Icons.person, color: Colors.pinkAccent,),
                      ),
                    ),
                    new TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Height in Feet',
                        suffixText: 'Ft',
                        labelStyle: new TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        border: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.red
                            )
                        ),
                        icon: new Icon(
                          Icons.assessment, color: Colors.pinkAccent,),
                      ),
                    ),
                    new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight In Kg',
                        suffixText: 'Kg',
                        labelStyle: new TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        border: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.red
                            )
                        ),
                        icon: new Icon(Icons.dehaze, color: Colors.pinkAccent),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(10.5)),
                    new Center(
                      child: new RaisedButton(
                        color: Colors.pinkAccent,
                        onPressed: _calc,
                        elevation: 20.0,
                        padding: EdgeInsets.all(10.0),
                        child: new Text(
                          'Calculate',
                          style: new TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.5)),
              new Center(
                child: new Text('$bmiout',
                    style:new TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 26.0,
                        color: Colors.blueAccent
                    )
                ),
              ),
              new Center(
                child: new Text('\'$note\'',
                    style:new TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 26.0,
                        color: Colors.red
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
