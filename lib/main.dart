
import 'package:antello/screens/chat_page.dart';
import 'package:antello/screens/home_page.dart';
import 'package:antello/screens/profile_page.dart';
import 'package:antello/screens/questions_page.dart';
import 'package:antello/screens/sign_page.dart';
import 'package:antello/themes/themes.dart';
import 'package:flutter/material.dart';
import 'classes/Utils.dart';


void main() {
  runApp(const MyApp());
}
final navigatorKey=GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: Utils.messengerKey,
      title: 'antello',
      theme: Themes.primaryTheme,
      initialRoute:"Chat",
      routes: {
        'Questions': (context) => const QuestionsPage(),
        'Home':(context)=>const HomePage(),
        'Signİn':(context)=> const SignPage(),
        'Profile':(context)=> const ProfilePage(),
        'Chat':(context)=> const ChatPage(),
      },
    );
  }
}
