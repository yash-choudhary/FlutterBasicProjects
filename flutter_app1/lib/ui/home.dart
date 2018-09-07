import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  void _onPressed() {
    print("Search Tapped!");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: new Text("Fancy Day"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: _onPressed),
          new IconButton(
              icon: new Icon(Icons.send),
              onPressed: () => debugPrint("Icon Pressed!")),
        ],
      ),
      backgroundColor: Colors.white,
      body: new Container(
          alignment: Alignment.center,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Hello!!",
                style: new TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.greenAccent.shade700),
              ),
              new InkWell(
                child: new Text(
                  "ADITYA!!",
                  style: new TextStyle(fontSize: 24.0),
                ),
                onTap: () => debugPrint("Tapped Once!!"),
                onLongPress: () => print("Long Pressed!!"),
              ),
            ],
          )),
      floatingActionButton: new FloatingActionButton(
        onPressed: ()=>print("Pressed"),
        backgroundColor: Colors.greenAccent.shade700,
        elevation: 5.00,
        foregroundColor: Colors.deepOrangeAccent,
        child: new Icon(Icons.person),
        tooltip: "Going Up!",
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.add),
              title: new Text("Add",
                  style: new TextStyle(fontWeight: FontWeight.w900))),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              title: new Text("Search",
                  style: new TextStyle(fontWeight: FontWeight.w900))),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.send),
              title: new Text("Send",
                  style: new TextStyle(fontWeight: FontWeight.w900)))
        ],
        onTap: (int i) => print("Hey Touched $i"),
      ),
    );
  }
}
