import 'package:alcol_ou_gasolina/widgets/logo.widget.dart';
import 'package:alcol_ou_gasolina/widgets/submitform-widget.dart';
import 'package:alcol_ou_gasolina/widgets/sucess.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar Gasolina";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1200),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _completed
                ? sucess(
                    reset: () {
                      setState(() {
                        _alcCtrl = new MoneyMaskedTextController();
                        _gasCtrl = new MoneyMaskedTextController();
                        _completed = false;
                        _busy = false;
                        _color = Colors.deepPurple;
                      });
                    },
                    result: _resultText)
                : SubmitForm(
                    gasCtrl: _gasCtrl,
                    alcCtrl: _alcCtrl,
                    busy: _busy,
                    submitFunc: calculate),
          ],
        ),
      ),
    );
  }

  Future calculate() async {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas = double.parse(
          _gasCtrl.text.replaceAll(new RegExp(r'[,.]'), ''),
        ) /
        100;
    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });

    // ignore: unnecessary_new
    return new Future.delayed(
        const Duration(seconds: 1),
        () => {
              setState(() {
                if (res >= 0.7) {
                  _resultText = "Compensa utilizar Gasolina!";
                } else {
                  _resultText = "Compensa utilizar Álcool!";
                }
                _busy = false;
                _completed = true;
              })
            });
  }
}
