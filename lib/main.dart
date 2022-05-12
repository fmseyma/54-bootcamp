import 'package:antello/screens/home_page.dart';
import 'package:antello/themes/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'antello',
      theme: Themes.primaryTheme,
      showSemanticsDebugger: false,
    
      home: const HomePage(),
    );
  }
}
