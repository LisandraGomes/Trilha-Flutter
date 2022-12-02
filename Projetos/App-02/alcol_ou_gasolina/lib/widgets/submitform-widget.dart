import 'package:alcol_ou_gasolina/widgets/input.widget.dart';
import 'package:alcol_ou_gasolina/widgets/loading-button.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class SubmitForm extends StatelessWidget {

  var gasCtrl = new MoneyMaskedTextController();
  var alcCtrl = new MoneyMaskedTextController();
  var busy = false;
  final void Function()? submitFunc;

  SubmitForm({
    required this.gasCtrl,
    required this.alcCtrl,
    required this.busy,
    required this.submitFunc,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(
          left: 10,
          right: 20,
        ),
        child: Input(label: "Gasolina", ctrl: gasCtrl),
        ),
         Padding(padding: EdgeInsets.only(
          left: 10,
          right: 20,
        ),
        child: Input(label: "Álcool", ctrl: alcCtrl), 
        ),
        LoadingButton(busy: busy, invert: false, func: submitFunc, text: "Calcular Novamente"),
      ],
    );
  }
}
