import 'package:antello/widgets/push_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'answer_input_box.dart';
class StudyWidget extends StatefulWidget {
  const StudyWidget({Key? key}) : super(key: key);

  @override
  _StudyWidgetState createState() => _StudyWidgetState();
}

class _StudyWidgetState extends State<StudyWidget> {
  @override
  Widget build(BuildContext context) {
    return
     Column(
        children: [
          Container(
            child: Text(" what are you currently studying ?",
                style: GoogleFonts.raleway(
                  fontSize: 24,
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          const AnswerInputBox(),
          const SizedBox(
          height: 150,
          ),
         const  PushButton(newroute:"Home" , butonyazisi:"Tamamla")
        ],
      );

  }
}
