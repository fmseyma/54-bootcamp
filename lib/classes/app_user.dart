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
  late String nickname;
  late String url;
  String? chatID;

  AppUser(
      {required this.department,
      required this.gender,
      required this.birthDate,
    
      required this.ad,
      required this.soyad,
      required this.nickname,
      required this.url,
      required this.bio});
AppUser.fromMap(Map<dynamic, dynamic> map) {
    print( "nası ya");
    department = map["department"];
    gender = map["gender"];
    birthDate = map["birthday"];
    ad = map["name"];
    soyad = map["surname"];
    nickname = map["nickname"];
    url = map["url"];  
    bio = map["bio"];
  }

 Future<String?> dialogKur(String username)async {

   if(chatID!=null) return chatID  ;
    var h = (await FirebaseDatabase.instance.ref("Users/$username/messages").child(username).  once());
    if(h.snapshot.exists) return h.snapshot.value as String;
   
   String? newChatId= FirebaseDatabase.instance.ref().child("messages").push().key;
   FirebaseDatabase.instance.ref("Users/$nickname/messages").set({username:newChatId});
   chatID=newChatId;
   return newChatId;
 }

 sendMessage(String newMessage, String sender){
    FirebaseDatabase.instance.ref().child("messages/$chatID").set({sender +":" + DateTime.now().toString():{
      "sender":sender,
      "time":DateTime.now().toString(),
      "message":newMessage
    }});
 

  
   
 }

 




}

class UserMAnagement {
  static List<AppUser> allusers=[];
  static Future<List<AppUser>> randomUser(int count) async{ 
    allusers=[];
   var a =await FirebaseDatabase.instance.ref("Users").once();

   for(var i in a.snapshot.children){
     print(i.value as Map);
     AppUser.fromMap(i.value as Map);
     allusers.add(AppUser.fromMap(i.value as Map));
   }
    return allusers;
  }
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
    print("$uid user indirildi");

    return AppUser.fromMap(newmap);
  }
  
  static AppUser sampleUser = AppUser(
//    mail: "aldkadjaslkd",
      ad: "Lorem",
      soyad: "IPSUM",
      bio:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      nickname: "hasda",
      gender: "gender",
      department: "Department",
      birthDate: "BirthDate",
     // uid: "sdadsa",
      url:"https://firebasestorage.googleapis.com/v0/b/antello.appspot.com/o/spotdatabase%2F1653946099214.jpg?alt=media&token=38906d6b-6045-4f58-8239-93f53b206c6d");
  static MatchQuestion sampleQuestion = MatchQuestion(
      answers: [
        "Edison",
        "Tesla",
      ],
     trueAnswer: "Tesla",
      owner: UserMAnagement.sampleUser,
      question: "Tesla mı Edison mu ?",
      shareTime: DateTime.now());
}
