

import 'package:antello/classes/app_user.dart';
import 'package:antello/classes/match_question_class.dart';
import 'package:antello/themes/app_colors.dart';
import 'package:antello/widgets/photo_chart.dart';
import 'package:antello/widgets/purple_button.dart';
import 'package:flutter/material.dart';

class MatchQuestionWidget extends StatefulWidget {
  final MatchQuestion matchQuestion;
  const MatchQuestionWidget({ Key? key,required this.matchQuestion }) : super(key: key);

  @override
  State<MatchQuestionWidget> createState() => _MatchQuestionWidgetState();
}

class _MatchQuestionWidgetState extends State<MatchQuestionWidget> {
  late MatchQuestion matchQuestion ;

  @override
  void initState() {
   matchQuestion=widget.matchQuestion;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      constraints: BoxConstraints(minHeight: 150),

      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        children: [
        Row(children: [
          SizedBox(
            width: 50,
            height:50,
            child: PhotoChart(appUser: widget.matchQuestion.owner),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(matchQuestion.owner.ad+" "+matchQuestion.owner.soyad),
          ),
          Expanded(child: SizedBox()),
          Text(matchQuestion.shareTime.toString())
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text(matchQuestion.question)],),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PurpleButton(answer: matchQuestion.answers.first, function: (_x){},),
            PurpleButton(answer: matchQuestion.answers.elementAt(1), function: (_x){},),
          ],
        )
      ],),
      
    );
  }
}