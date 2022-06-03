import 'package:antello/classes/new_user_informations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/gender_questions.dart';
import 'answer_card.dart';
class GenderWidget extends StatefulWidget {
  const GenderWidget({Key? key}) : super(key: key);

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            child: Text(" what is your gender ?",
                style: GoogleFonts.raleway(
                  fontSize: 24,
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          AnswerBox(yanit: Answers(cevap: "kız"),function: isChecked,),
          const SizedBox(
            height: 50,
          ),
          AnswerBox(yanit: Answers(cevap: "erkek"),function: isChecked,),
           const SizedBox(
            height: 50,
          ),
          AnswerBox(yanit: Answers(cevap: "belirtmek istemiyorum"), function:isChecked),
          const SizedBox(
            height: 50,
          )
        ],
      );

  }

    void isChecked(Answers _ans){
      print(_ans.cevap);
setState(() {
NewUser.gender=_ans;

  
});


    
  }
}
