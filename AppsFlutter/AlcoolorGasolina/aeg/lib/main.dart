import 'package:aeg/widgets/input.widget.dart';
import 'package:aeg/widgets/loading-button.widget.dart';
import 'package:aeg/widgets/logo.widget.dart';
import 'package:aeg/widgets/sucess.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasCtrl =
      new MoneyMaskedTextController(); // Controlar o valor como dinheiro
  var _alcCtrl =
      new MoneyMaskedTextController(); // Controlar o valor como dinheiro
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // Define a cor primária
      body: ListView(
        children: <Widget>[
          Logo(), // chamar classe logo do arquivo 'logo.widget.dart
          Sucess(
            reset: () {},
            result: "Compensa utilizar X",
          ),
          Input(
            ctrl: _gasCtrl,
            label: "Gasolina",
          ),
          Input(
            ctrl: _alcCtrl,
            label: "Álcool",
          ),
          LoadingButton(
            busy: true,
            func: () {},
            text: "CALCULAR",
            invert: false,
          ),
        ],
      ),
    );
  }
}
