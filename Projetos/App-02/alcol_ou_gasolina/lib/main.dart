
import 'package:alcol_ou_gasolina/widgets/button.widget.dart';
import 'package:alcol_ou_gasolina/widgets/input.widget.dart';
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

class HomePage extends StatelessWidget {
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          SizedBox(height: 20,),
          
          Input(label: "Gasolina", ctrl: _gasCtrl),    
          Input(label: "Álcool", ctrl: _alcCtrl), 
          butao()           
        ],
      ),
    );
  }
}
