import 'package:antello/classes/match_question_class.dart';

class AppUser {
  final String ad;
  final String soyad;
  final String bio;

  AppUser({required this.ad, required this.soyad,required this.bio});


}




class UserMAnagement{

  static AppUser sampleUser = AppUser(ad: "Lorem", soyad: "IPSUM", bio: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");
  static MatchQuestion sampleQuestion= MatchQuestion(answers: {"Edison": [UserMAnagement.sampleUser],"Tesla":[UserMAnagement.sampleUser],}, owner: UserMAnagement.sampleUser, question: "Tesla mı Edison mu ?", shareTime: DateTime.now());
}

