import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:ElevatedButton.styleFrom(
          primary: Color(0xFFF9082EC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
        onPressed:(){}, child:Text("Mesaj Gönder",style:GoogleFonts.raleway(
      color:Colors.white,
    ),));
  }
}
