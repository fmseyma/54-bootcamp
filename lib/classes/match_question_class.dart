import 'package:antello/classes/app_user.dart';

class MatchQuestion {
  final DateTime shareTime;
  final AppUser owner;
  final  String question;
  final  Map<String, List<AppUser>> answers;

   MatchQuestion({required this.answers, required this.owner, required this.question, required this.shareTime});




}