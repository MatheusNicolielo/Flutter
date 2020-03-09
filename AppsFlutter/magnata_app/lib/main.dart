import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magnata App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double grana = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Magnata",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // Titulo
            Center(
              child: Text(
                "Fique Rico!",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 29.9,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "R\$$grana",
                  style: TextStyle(
                    fontSize: 45.6,
                    color: grana >= 10000 ? Colors.blue : Colors.green,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: FlatButton(
                  onPressed: () {
                    _incrementGrana();
                  },
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                  child: Text("Aumentar Valor"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _incrementGrana() {
    setState(() {
      grana += 2000;
    });
  }
}
