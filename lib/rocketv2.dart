import 'package:flutter/material.dart';

void main() => runApp(Rocket());

class Rocket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rocket",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RocketHome(),
    );
  }
}

class RocketHome extends StatefulWidget {
  @override
  _RocketHome createState() => _RocketHome();
}

class _RocketHome extends State<RocketHome> {
  double _bottomMargin = 0;

  void _flyRocket() {
    setState(() {
      _bottomMargin = MediaQuery.of(context).size.height / 1.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/ciel.jpg"),fit: BoxFit.cover)),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  // height: 350,
                  // width: 250,
                  margin: EdgeInsets.only(bottom: _bottomMargin),
                  //color: Colors.blue,
                  child: Image.asset(
                    "images/rocket.png",
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _flyRocket,
        child: Text("Lancer"),
      ),
    );
  }
}