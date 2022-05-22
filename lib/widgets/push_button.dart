import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class PushButton extends StatelessWidget {
  final String newroute;
   final String butonyazisi;

   const PushButton({
    Key? key,
    required this.newroute,
    required this.butonyazisi,
  }) : super(key: key);

  @override
  Widget build(context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(320, 50),
            primary: const Color(0xFF26235C),
            onPrimary: Colors.white,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        onPressed: () {
          Navigator.of(context).pushNamed(newroute);
        },
        child: Text(butonyazisi,
            style: GoogleFonts.raleway(
              fontSize: 24,
            )));
  }
}
