import 'package:antello/classes/new_user_informations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/gender_questions.dart';

class AnswerBox extends StatelessWidget {
  final Answers yanit;

  final Function(Answers) function;
 const AnswerBox({Key? key, required this.yanit,  required this.function }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Align(
        alignment: Alignment.center,
        child: CheckboxListTile(
          
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            yanit.cevap,
            style: GoogleFonts.raleway(),
          ),
          value: yanit.cevap==NewUser.gender.cevap,
          onChanged: (bool? value) {
            print(value);
            print(yanit.cevap);

            function(value??false ? yanit: Answers(cevap: "cevap"));
 
            
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
