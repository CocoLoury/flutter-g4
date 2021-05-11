import 'package:flutter/material.dart';

// Création d'une nouvelle page de l'application
class newPage extends StatefulWidget{
  @override
  _newPage createState() => _newPage();
}

class _newPage extends State<newPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("newPage"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {Navigator.pop(context);},
            child: Text("Retour")
        ),
      ),
    );
  }
}