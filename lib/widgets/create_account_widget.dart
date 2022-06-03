import 'package:antello/widgets/push_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'answer_input_box.dart';
import 'create_account_input_boxes.dart';
class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({Key? key}) : super(key: key);

  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            child: Text("Hesap Oluştur",
                style: GoogleFonts.raleway(
                  fontSize: 24,
                )),
          ),
          const CreateAccountInputBoxesWidget(),
          const SizedBox(
            height: 150,
          ),
        ],
      );

  }
}
