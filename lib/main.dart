import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'newPage.dart';

//première méthode pour lancer l'application
void main() {
  runApp(MyApp());
}
// void main() => runApp(MyApp);


// déclaration notre classe principale qui va extends StatelessWidget
class MyApp extends StatelessWidget {
  // Notre objet / widget principal "root application"
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New App G4 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Mon app Flutter G4'),
      debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true,
    );
  }
}

//cette class est le widget principal de notre application
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// notre classe définitive pour l'assemblage de notre app
class _MyHomePageState extends State<MyHomePage> {
  bool _vrai = false;
  int _counter = 0;

  void _changeColor(){
    setState(() {
      _vrai = !_vrai;
    });
  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });

  }

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    //déclaration des variable utilisé dans nos widgets
    String _texte = "Mon texte";
    String _imgext = "https://images2.alphacoders.com/857/thumb-1920-857119.jpg";
    String _imgInt = "images/test-g4-flutter.jfif";
    double _largeur = MediaQuery.of(context).size.width;
    // déclaration de nos méthodes personnelles
    void _prinTexte(){
      print(_texte);
    }
    // setState sera appelé à partir d'ici
    return Scaffold(
      appBar: AppBar(
        title: Text("Titre"),
        leading: Icon(Icons.account_circle),
        actions: [
          Icon(Icons.access_alarm),
          Icon(Icons.golf_course),
          Icon(Icons.directions_bike),
        ],
        elevation: 15,
        shadowColor: Colors.teal,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text("Bottom",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            // fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          textScaleFactor: 0.75,

        ),
        color: Colors.teal,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.all(10),
              color: Colors.black,
              child:
              Image.asset(_imgInt, fit: BoxFit.cover),
            ),
            Text(_texte, style: TextStyle(
              color: (_vrai) ? Colors.pink[900] : Colors.blue[600],
              fontSize: 30,
            ),),
            Text("essai $_texte $_counter"),
            Text(_counter.toString()),
            Card(
              elevation: 5,
              shadowColor: Colors.grey[300],
              color: Colors.grey,
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Image.network(
                  _imgext,
                  fit: BoxFit.cover,
                  loadingBuilder: (contexte, child, loadingProgress){
                    if(loadingProgress == null){
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded
                            / loadingProgress.expectedTotalBytes
                            :null,
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                TextButton(
                onPressed: _changeColor,
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.teal[100],
                    elevation: 5,
                    shadowColor: Colors.red,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                    )
                ),
                child: Text("Clique ici"),
              ),
                ElevatedButton(
                    onPressed: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => newPage()));
                    },
                    style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.transparent,
                    elevation: 0
                ),
                child: Text("Aussi")
            ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.green[200],
              //margin: EdgeInsets.all(10),
              //transform: Matrix4.rotationZ(-0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    //height: 25,
                    width: _largeur / 10,
                    color: Colors.yellow[900],
                  ),
                  Container(
                    height: 25,
                    width: _largeur / 10,
                    color: Colors.yellow[800],
                  ),
                  Container(
                    height: 25,
                    width: _largeur / 10,
                    color: Colors.yellow[700],
                  ),
                  Container(
                    height: 25,
                    width: _largeur / 10,
                    color: Colors.yellow[600],
                  ),
                  Container(
                    height: 25,
                    width: _largeur / 10,
                    color: Colors.yellow[500],
                  ),
                  Container(
                    height: 25,
                    width: _largeur / 10,
                    color: Colors.yellow[400],
                  ),
                  Container(
                    height: 25,
                    width: _largeur / 10,
                    color: Colors.yellow[300],
                  ),
                  Container(
                    height: 25,
                    width: _largeur / 10,
                    color: Colors.yellow[200],
                  ),
                  Container(
                    height: 25,
                    width: _largeur / 10,
                    color: Colors.yellow[100],
                  ),
                  Container(
                    height: 25,
                    width: _largeur / 10,
                    color: Colors.yellow[50],
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.blue[800],
              margin: EdgeInsets.only(top:10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    Icons.thumb_up,
                    size: _largeur / 8,
                    color: Colors.blue[200],
                  ),
                  Icon(
                    Icons.fast_rewind,
                    size: _largeur / 8,
                    color: Colors.blue[300],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.blue[400],
                    ),
                    onPressed: _changeColor,
                    tooltip: "Changer couleur...",
                  ),
                  Icon(
                    Icons.fast_forward,
                    size: _largeur / 8,
                    color: Colors.blue[500],
                  ),
                  Icon(
                    Icons.thumb_down,
                    size: _largeur / 8,
                    color: Colors.blue[200],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        elevation: 10,
        tooltip: "Changer la couleur",
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
