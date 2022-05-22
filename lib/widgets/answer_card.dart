import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/gender_questions.dart';

class AnswerBox extends StatefulWidget {
  final Answers yanit;
 const AnswerBox({Key? key, required this.yanit}) : super(key: key);

  @override
  _AnswerBoxState createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Align(
        alignment: Alignment.center,
        child: CheckboxListTile(
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            widget.yanit.cevap,
            style: GoogleFonts.raleway(),
          ),
          value: _checked,
          onChanged: (bool? value) {
            setState(() {
              _checked = value;
            });
          },
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(350, 50),
        primary: Colors.white,
        shadowColor: Colors.grey,
        elevation: 6,
      ),
      onPressed: () {},
    );
  }
}
