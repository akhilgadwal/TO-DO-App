import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:matcher/matcher.dart';

class Mybuttons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Mybuttons({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(
        text,
        style:
            TextStyle(fontFamily: 'Beabus', fontSize: 20, color: Colors.white),
      ),
    );
  }
}
