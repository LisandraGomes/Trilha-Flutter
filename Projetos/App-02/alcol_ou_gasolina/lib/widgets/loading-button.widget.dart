import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
 final void Function()? func;
  var text = "";

LoadingButton({
  required this.busy,
  required this.invert,
  required this.func,
  required this.text
});

  @override
  Widget build(BuildContext context) {
    return busy ?
    Container(alignment: Alignment.center,
          height: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
    ) 
    :
     Container(
      margin: EdgeInsets.all(30),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: invert? Theme.of(context).primaryColor: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(60)),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
              color: invert ? Colors.white.withOpacity(0.8) : Theme.of(context).primaryColor,
              fontSize: 30,
              fontFamily: "Big Shoulders Display"),
        ),
        onPressed: func,
      ),
    );
  }
}
