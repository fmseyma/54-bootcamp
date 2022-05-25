
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTimePicker extends StatefulWidget {
 const DateTimePicker({Key? key}) : super(key: key);
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize:const Size(300,50),
            primary: Colors.white,
            shadowColor: Colors.grey,
            elevation: 6,
          ),
          child: Text("select your birthday",
              style: GoogleFonts.raleway(
                fontSize: 16,
                color: const Color(0xFF26235C),
              )),
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(1920),
              lastDate: DateTime.now(),
            );
            if (newDate == null) {
              return;
            } else {
              setState(() {
                date = newDate;
              });
            }
          }),
    ]);
  }
}
