import 'package:flutter/material.dart';

void main() => runApp(Rocket());

class Rocket extends StatelessWidget{
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

class RocketHome extends StatefulWidget{
  @override
  _RocketHome createState() => _RocketHome();
}

class _RocketHome extends State<RocketHome>{

  double _bottomMargin = 0;
  void _flyRocket(){
    setState(() {
      _bottomMargin = 500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: 350,
                width: 250,
                margin: EdgeInsets.only(bottom: _bottomMargin),
                child: Image.asset("images/rocket.png"),
              ),
              ElevatedButton(
                onPressed: _flyRocket,
                child: Text(
                  'Lancer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}