import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          SizedBox(height: 60),
          Image.asset("assets/images/aog-white.png", height: 100,)
          ,
          SizedBox(height: 15,)
          ,
          Text("Alcool ou Gasolina",
            style: TextStyle(
              color: Colors.white,
               fontSize: 40,
               fontFamily: "Big Shoulders Display",
               )
               ,textAlign: TextAlign.center, 
          )
      ],
    );
  }
}
