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
            onPressed: _showMyDialog,
            //onPressed: () {Navigator.pop(context);},
            child: Text("Popup")
        ),
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}