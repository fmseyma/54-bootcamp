import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar ProfileAppBar(BuildContext context) {
  return  AppBar(
    actions: [
      IconButton(onPressed: (){}, icon:const Icon(FontAwesomeIcons.pen,color:Color(0xFF26235C),))
    ],
    backgroundColor: Colors.white,
    leading:  const BackButton(color: Color(0xFF26235C),),
    centerTitle: true,
    title: Text(
      "Profile",
      style: GoogleFonts.raleway(
        fontSize: 25,
        fontStyle: FontStyle.italic,
        color: const Color(0xFF26235C),
      ),
    ),
  );
}