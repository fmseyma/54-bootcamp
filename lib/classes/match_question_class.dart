import 'dart:html';

import 'package:antello/classes/app_user.dart';

class MatchQuestion {
  late  DateTime shareTime;
  late  AppUser owner;
  late  String question;
  late   List<String> answers;
  late   String trueAnswer;
    

   MatchQuestion({required this.answers, required this.owner, required this.question, required this.trueAnswer,required this.shareTime});

MatchQuestion.fromthings({   
 required  AppUser user,
 required   String soru,
  required  List<String> cevaplar,
  required  String dogrucevap
}){

shareTime=DateTime.now();
owner=user;
question=soru;
answers=cevaplar;
trueAnswer=dogrucevap;


}



}