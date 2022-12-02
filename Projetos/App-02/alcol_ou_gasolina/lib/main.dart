
import 'package:alcol_ou_gasolina/pages/home.pages.dart';
import 'package:alcol_ou_gasolina/widgets/submitform-widget.dart';
import 'package:alcol_ou_gasolina/widgets/sucess.widget.dart';
import 'package:alcol_ou_gasolina/widgets/input.widget.dart';
import 'package:alcol_ou_gasolina/widgets/loading-button.widget.dart';
import 'package:alcol_ou_gasolina/widgets/logo.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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


