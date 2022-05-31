import 'package:antello/classes/match_question_class.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class AppUser {
  late String ad;
  late String soyad;
  late String bio;
  late String department;
  late String gender;
  late String birthDate;
  late String mail;
  late String nickname;
  late String uid;
  late String url;

  AppUser(
      {required this.department,
      required this.gender,
      required this.birthDate,
      required this.mail,
      required this.uid,
      required this.ad,
      required this.soyad,
      required this.nickname,
      required this.url,
      required this.bio});
AppUser.fromMap(Map<dynamic, dynamic> map) {
    department = map["department"];
    gender = map["gender"];
    birthDate = map["birthDate"];
    mail = map["mail"];
    uid = uid;
    ad = map["ad"];
    soyad = map["soyad"];
    nickname = map["nickname"];
    url = map["url"];  
    bio = map["bio"];
  }
}

class UserMAnagement {
  static Future<AppUser>  fromUid(String uid) async {
    Map<String, dynamic> newmap = {};

    final database = FirebaseDatabase.instance;
    DatabaseReference messagesRef = database.ref('Users/$uid');
   await messagesRef.once().then((value) {
      newmap.addAll({
        "ad": value.snapshot.child("name"),
        "soyad": value.snapshot.child("name"),
        "bio": value.snapshot.child("name"),
        "mail": value.snapshot.child("name"),
        "birthDate": value.snapshot.child("name"),
        "gender": value.snapshot.child("name"),
        "department": value.snapshot.child("name"),
        "nickname": value.snapshot.child("name"),
        "url": value.snapshot.child("name"),
        "uid": uid,
      });
    });
    print("newuser Oluşturuldu");

    return AppUser.fromMap(newmap);
  }
  
  static AppUser sampleUser = AppUser(
    mail: "aldkadjaslkd",
      ad: "Lorem",
      soyad: "IPSUM",
      bio:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      nickname: "hasda",
      gender: "gender",
      department: "Department",
      birthDate: "BirthDate",
      uid: "sdadsa",
      url:"https://firebasestorage.googleapis.com/v0/b/antello.appspot.com/o/spotdatabase%2F1653946099214.jpg?alt=media&token=38906d6b-6045-4f58-8239-93f53b206c6d");
  static MatchQuestion sampleQuestion = MatchQuestion(
      answers: {
        "Edison": [UserMAnagement.sampleUser],
        "Tesla": [UserMAnagement.sampleUser],
      },
      owner: UserMAnagement.sampleUser,
      question: "Tesla mı Edison mu ?",
      shareTime: DateTime.now());
}
