import 'package:antello/classes/app_user.dart';
import 'package:antello/classes/match_question_class.dart';
import 'package:antello/widgets/match_question.dart';
import 'package:antello/widgets/user_chart.dart';
import 'package:antello/widgets/user_match_question_widget.dart';
import 'package:flutter/material.dart';

class MatchTab extends StatefulWidget {
  const MatchTab({ Key? key }) : super(key: key);

  @override
  State<MatchTab> createState() => _MatchTabState();
}

class _MatchTabState extends State<MatchTab> {

  @override
  void initState() {
   birincieleman=UserMatchQuestionWidget(user: UserMAnagement.sampleUser, tamamfonk:tamamfonk);
    // TODO: implement initState
    super.initState();
  }
  late Widget birincieleman;
  tamamfonk(MatchQuestion question){
  birincieleman=MatchQuestionWidget(matchQuestion: question);
   setState(() {
     
   });

  }
  

  List<Widget> matchQuestions(int s){

    List<Widget> _i = [birincieleman];

    while(_i.length<s){
      _i.add(MatchQuestionWidget(matchQuestion: UserMAnagement.sampleQuestion));
      
    }
    return _i;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children:  matchQuestions(5) ,),
    );
  }
}