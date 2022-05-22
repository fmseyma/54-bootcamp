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
          AnswerBox(yanit: Answers(cevap: "kız")),
          const SizedBox(
            height: 50,
          ),
          AnswerBox(yanit: Answers(cevap: "erkek")),
          const SizedBox(
            height: 50,
          ),
          AnswerBox(yanit: Answers(cevap: "belirtmek istemiyorum")),
          const SizedBox(
            height: 50,
          )
        ],
      );

  }
}
