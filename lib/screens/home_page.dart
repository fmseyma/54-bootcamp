import 'package:antello/classes/app_user.dart';
import 'package:flutter/material.dart';
import '../widgets/user_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserChart(
              appuser: AppUser(ad: "Yusuf", soyad: "ÖZil", bio: "slkflksd"),
            ),

          ],
        ),
      )),
    );
  }
}
