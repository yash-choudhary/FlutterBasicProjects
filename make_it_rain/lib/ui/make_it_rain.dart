import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneycounter = 0;

  void _rainmoney() {
    setState(() {
      _moneycounter += 100;
    });
  }

//NO need:
//  Text _countercolor(){
//    if(_moneycounter>=10000){
//      return new Text(
//        '\$$_moneycounter',
//        style: new TextStyle(
//          color: Colors.redAccent,
//          fontWeight: FontWeight.w900,
//          fontSize: 30.0,
//        ),
//      );
//    }else{
//      return new Text(
//        '\$$_moneycounter',
//        style: new TextStyle(
//          color: Colors.greenAccent,
//          fontWeight: FontWeight.w900,
//          fontSize: 30.0,
//        ),
//      );
//    }
//}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Make It Rain!!",
          style: new TextStyle(fontSize: 25.00, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.green,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(
                "Get Rich",
                style: new TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                ),
              ),
            ),
            new Expanded(
                child: new Center(
                    child: new Text(
              '\$$_moneycounter',
              style: new TextStyle(
                color: _moneycounter>=10000?Colors.redAccent:Colors.greenAccent,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
              ),
            ))),
            new Expanded(
              child: new Center(
                  child: new FlatButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: _rainmoney,
                      child: new Text(
                        "Let It Rain!!",
                        style: new TextStyle(
                          fontSize: 25.00,
                          fontWeight: FontWeight.w500,
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
