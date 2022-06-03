import 'package:antello/classes/app_user.dart';
import 'package:antello/classes/gender_questions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NewUser {
  static Answers gender = Answers(cevap: "cevap");
  static DateTime birthday = DateTime(2007);
  static String department = "";
  static String name = "";
  static String surname = "";
  static String nickname = "";
  static String mail = "";
  static String password = "";
  static String bio = "";

  static String uid = "";
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.white, letterSpacing: 0.5),
      ),
    );
  }
  
  static bool control(){
  return true;
   
   String content ="";
   List info = [
     "İsim boş bırakılamaz",
     "Soyisim boş bırakılamaz",
     "Mail boş bırakılamaz",
     "Takma ad boş bırakılamaz",
     "Şifre boş bırakılamaz",
     "Şifre onay boş bırakılamaz",
     "Şifreler uyuşmuyor bırakılamaz",
   ];

  if( name == ""){content=info[0]; customSnackBar(content: content); return false;} 
  if( surname == ""){content=info[1]; customSnackBar(content: content); return false;}
  if( nickname == ""){content=info[3]; customSnackBar(content: content); return false;}
  if( mail == ""){content=info[2]; customSnackBar(content: content); return false;}
  if( password == ""){content=info[4]; customSnackBar(content: content); return false;}
  

  return true;



  }
  static olustur() {
    Map<String, dynamic> newmap = {};
    newmap.addAll(
        {
        "name": name,
        "surname": surname,
        "department": department,
        "gender": gender.toString(),
        "birthday": birthday.toString(),
        "nickname": nickname,
        "mail": mail,
        "bio": bio,
        "url":"",
        "secret":{uid.toString(): true, "password": password},
       
      },
    );
    final database = FirebaseDatabase.instance;
    
    DatabaseReference messagesRef = database.ref('Users/$nickname');
    database.ref("uids/").set({uid:nickname});
    messagesRef.set(newmap).then((value){ print("newuser Oluşturuldu");});
   
  }
}
