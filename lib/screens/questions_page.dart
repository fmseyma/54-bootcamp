import 'package:antello/widgets/birthday_widget.dart';
import 'package:antello/widgets/gender_widget.dart';
import 'package:antello/widgets/study_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/introduction_widget.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int currentstep = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF26235C),
        title: Text(
          "Formica",
          style: GoogleFonts.montserrat(
            color: const Color(0xFFF7DF1E),
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                pageController.previousPage(
                    duration: const Duration(milliseconds: 10),
                    curve: Curves.bounceInOut);
              },
              icon: const Icon(FontAwesomeIcons.angleLeft)),
          IconButton(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 10),
                    curve: Curves.bounceInOut);
              },
              icon: const Icon(FontAwesomeIcons.angleRight))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            StepProgressIndicator(
              totalSteps: 100,
              currentStep: currentstep,
              size: 5,
              padding: 0,
              selectedColor: const Color(0xFF26235C),
              unselectedColor: Colors.grey,
              roundedEdges: const Radius.circular(10),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: PageView(
                onPageChanged: (gecis) {
                  setState(() {
                    currentstep = gecis * 25;
                  });
                },
                pageSnapping: true,
                controller: pageController,
                children: const [
                  GenderWidget(),
                  BirthdayWidget(),
                  StudyWidget(),
                  IntroduceWidget(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
