
import 'package:antello/firebase_options.dart';
import 'package:antello/scaffold/bottom_navigation_bar.dart';
import 'package:antello/screens/home_page.dart';
import 'package:antello/screens/questions_page.dart';
import 'package:antello/screens/sign_in_screen.dart';
import 'package:antello/themes/themes.dart';
import 'package:antello/utils/email_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
final navigatorKey=GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: Email.messengerKey,
      title: 'formica',
      theme: Themes.primaryTheme,
      initialRoute: 'Home',

      routes: {
        'SignIn': (context) => const SignInScreen(),
        'Home':(context)=>const HomePage(),
      },
    );
  }

}

