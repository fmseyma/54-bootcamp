import 'package:antello/widgets/introduction_input_box.dart';
import 'package:antello/widgets/push_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'answer_input_box.dart';
class IntroduceWidget extends StatefulWidget {
  const IntroduceWidget({Key? key}) : super(key: key);

  @override
  _IntroduceWidgetState createState() => _IntroduceWidgetState();
}

class _IntroduceWidgetState extends State<IntroduceWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            child: Text(" Introduce Yourself",
                style: GoogleFonts.raleway(
                  fontSize: 24,
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          const IntroductionInputBox(),
          const SizedBox(
            height: 150,
          ),
        ],
      );

  }
}