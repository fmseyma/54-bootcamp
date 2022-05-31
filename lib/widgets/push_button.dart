import 'package:antello/classes/app_user.dart';
import 'package:antello/classes/new_user_informations.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class PushButton extends StatelessWidget {
  final void Function() function;
   final String butonyazisi;
   final double width;
   final double height;
   final Color backgroundColor;
   final Color textColor;

   const PushButton({
    Key? key,
    required this.function,
    this.width=320,
    this.height=50,
    required this.butonyazisi,
    this.backgroundColor= const Color(0xFF26235C) ,
    this.textColor= Colors.white  ,
  }) : super(key: key);

  @override
  Widget build(context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width, height),
            primary: backgroundColor,
            onPrimary: textColor,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        onPressed: function,
        child: Text(butonyazisi,
            style: GoogleFonts.raleway(
              fontSize: 24,
            )));
  }
}
