import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

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
  // Variable
  double _value = 35.0;

  @override
  Widget build(BuildContext context) {
    String _img = "https://www.booska-p.com/up/images/news/kaaris-or-noir-cover.jpg";
    // setState sera appelé à partir d'ici
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("App Music"),
        titleTextStyle: TextStyle(
          color: Colors.white
        ),
        backgroundColor: Colors.black,
        elevation: 15,
        shadowColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            Card(
              elevation: 5,
              shadowColor: Colors.white,
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 1.5,
                color: Colors.black,
                child: Image.network(
                  _img,
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
            Text(
              "Or noir",
              style: TextStyle(
                color: Colors.white,
                fontSize: 17
              ),
            ),
            Text(
              "Kaaris",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 70, right: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.fast_rewind, color: Colors.white),
                  Icon(Icons.play_arrow, color: Colors.white),
                  Icon(Icons.fast_forward, color: Colors.white)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "0:00",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  Slider(
                      value: _value.toDouble(),
                      min: 0.0,
                      max: 100.0,
                      activeColor: Colors.orange,
                      inactiveColor: Colors.white,
                      onChanged: (double newValue) {
                        setState(() {
                          _value = newValue;
                        });
                      }
                  ),
                  Text(
                    "3:45",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}

