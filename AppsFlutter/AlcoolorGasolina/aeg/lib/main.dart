import 'package:aeg/pages/home-page.dart';
import 'package:aeg/widgets/input.widget.dart';
import 'package:aeg/widgets/loading-button.widget.dart';
import 'package:aeg/widgets/logo.widget.dart';
import 'package:aeg/widgets/submit-form.dart';
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
