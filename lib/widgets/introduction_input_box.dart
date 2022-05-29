import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroductionInputBox extends StatefulWidget {
  const IntroductionInputBox({Key? key}) : super(key: key);

  @override
  _IntroductionInputBoxState createState() => _IntroductionInputBoxState();
}

class _IntroductionInputBoxState extends State<IntroductionInputBox> {
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
      height: 200,

      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
        ],
        controller: _controller,
        maxLines: 20,
        maxLength: 300,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          icon: const Icon(Icons.account_circle_rounded),
          hintText: "Talk about what you want.....",
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