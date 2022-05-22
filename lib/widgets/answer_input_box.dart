import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnswerInputBox extends StatefulWidget {
  const AnswerInputBox({Key? key}) : super(key: key);

  @override
  _AnswerInputBoxState createState() => _AnswerInputBoxState();
}

class _AnswerInputBoxState extends State<AnswerInputBox> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 50,
      child: TextField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
        ],
        controller: _controller,
        maxLength: 20,
        decoration: InputDecoration(
          icon: const Icon(FontAwesomeIcons.book),
          hintText: "math,biology.....",
          hintStyle: const TextStyle(
            color: Color(0x9526235C),
            fontStyle: FontStyle.italic,
          ),
          suffixIcon: _controller.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  onPressed: () => _controller.clear(),
                  icon: const Icon(Icons.close)),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        textInputAction: TextInputAction.continueAction,
      ),
    );
  }
}
