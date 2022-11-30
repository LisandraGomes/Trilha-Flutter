import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class butao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(60)),
      child: TextButton(
        child: Text(
          "Calcular",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30,
              fontFamily: "Big Shoulders Display"),
        ),
        onPressed: () {},
      ),
    );
  }
}
