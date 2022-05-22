
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'datetimepicker.dart';

class BirthdayWidget extends StatefulWidget {
  const BirthdayWidget({Key? key}) : super(key: key);

  @override
  _BirthdayWidgetState createState() => _BirthdayWidgetState();
}

class _BirthdayWidgetState extends State<BirthdayWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text("  when is your birthday ?",
              style: GoogleFonts.raleway(
                fontSize: 24,
              )),
        ),
        const SizedBox(
          height: 50,

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  const [
            FaIcon(
              FontAwesomeIcons.calendarDays,
              size: 40,
            ),
            SizedBox(
              width: 10,
            ),
            DateTimePicker(),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
