import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
final TextEditingController _weightController = new TextEditingController();
String _planetName = "Earth";
double _finalWeight = 0.0;
double multiplier;
double calcWeight(double weight, double mul){
  return weight*mul;
}
String _printed = "Hello There!!";
String _finalString(){
  return "Your Weight on $_planetName is ${_finalWeight.toStringAsFixed(1)} Kg!";
}
  int radioValue = 0;
  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;
      switch(radioValue){
        case 0: multiplier =0.38;_planetName = 'Mercury';break;
        case 1: multiplier =0.91;_planetName = 'Venus';break;
        case 2: multiplier =1.00;_planetName = 'Earth';break;
        case 3: multiplier =0.38;_planetName = 'Mars';break;
        case 4: multiplier =2.34;_planetName = 'Jupyter';break;
        case 5: multiplier =1.06;_planetName = 'Saturn';break;
        case 6: multiplier =0.92;_planetName = 'Uranus';break;
        case 7: multiplier =1.19;_planetName = 'Neptune';break;
        case 8: multiplier =0.06;_planetName = 'Pluto';break;
        }
      _finalWeight = calcWeight(double.parse((_weightController.text)),multiplier);
      _printed = _finalString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weight On Planet X'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent.shade700,
        elevation: 15.0,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/uranus.png',
              height: 150.0,
              width: 150.0,
            ),
            new Container(
              margin: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Your Weight on Earth",
                        hintText: "In Kilograms",
                        icon: new Icon(Icons.accessibility_new)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  //three radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.grey, ),
                      new Text("Mercury",style: new TextStyle(
                        color: Colors.blueAccent
                      ),),
                      new Radio<int>(
                          value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.amber),
                      new Text("Venus",style: new TextStyle(
                          color: Colors.blueAccent
                      ),),
                      new Radio<int>(
                          value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.blueAccent),
                      new Text("Earth",style: new TextStyle(
                          color: Colors.blueAccent
                      ),),

                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        value: 3, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.redAccent, ),
                      new Text("Mars",style: new TextStyle(
                          color: Colors.blueAccent
                      ),),
                      new Radio<int>(
                          value: 4, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.orangeAccent),
                      new Text("Jupiter",style: new TextStyle(
                          color: Colors.blueAccent
                      ),),
                      new Radio<int>(
                          value: 5, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.orange),
                      new Text("Saturn",style: new TextStyle(
                          color: Colors.blueAccent
                      ),),

                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        value: 6, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.lightBlue, ),
                      new Text("Uranus",style: new TextStyle(
                          color: Colors.blueAccent
                      ),),
                      new Radio<int>(
                          value: 7, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.blue),
                      new Text("Neptune",style: new TextStyle(
                          color: Colors.blueAccent
                      ),),
                      new Radio<int>(
                          value: 8, groupValue: radioValue, onChanged: handleRadioValueChanged,activeColor: Colors.brown),
                      new Text("Pluto",style: new TextStyle(
                          color: Colors.blueAccent
                      ),),

                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.6)),
                  new Text(
                    _printed,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
