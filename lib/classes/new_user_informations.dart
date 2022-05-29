import 'package:antello/classes/app_user.dart';
import 'package:antello/classes/gender_questions.dart';

class NewUser{
  static Answers gender=Answers(cevap: "cevap");
  static DateTime birthday= DateTime(2007);
  static String department="";
  static olustur(){
    print("newuser Oluşturuldu");
  }
}