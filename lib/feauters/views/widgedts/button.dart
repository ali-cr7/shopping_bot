import 'package:flutter/material.dart';
import 'package:shopping_bot/constants.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onTap;
  
  // ignore: use_key_in_widget_constructors
  const Button({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        alignment: Alignment.centerRight,
        child: Container(
          alignment: Alignment.center,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color:kSecondColor,
          ),
          child: MaterialButton(
              onPressed: onTap,
              // ignore: prefer_const_constructors
              child: Text(
                // ignore: unnecessary_string_interpolations
                '$text',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Acaslon SemiBold',
                  fontSize: 17,
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }
}
