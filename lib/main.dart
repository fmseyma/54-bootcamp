
import 'package:antello/firebase_options.dart';
import 'package:antello/scaffold/bottom_navigation_bar.dart';
import 'package:antello/screens/home_page.dart';
import 'package:antello/screens/questions_page.dart';
import 'package:antello/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'antello',
      theme: Themes.primaryTheme,
      home: QuestionsPage(),
      
      
      
    );
  }

}

