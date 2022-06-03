
import 'package:antello/firebase_options.dart';
import 'package:antello/scaffold/bottom_navigation_bar.dart';
import 'package:antello/screens/home_page.dart';
import 'package:antello/screens/questions_page.dart';
import 'package:antello/screens/sign_in_screen.dart';
import 'package:antello/themes/themes.dart';
import 'package:antello/utils/email_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';

const USE_DATABASE_EMULATOR = false;
// The port we've set the Firebase Database emulator to run on via the
// `firebase.json` configuration file.
const emulatorPort = 9000;
// Android device emulators consider localhost of the host machine as 10.0.2.2
// so let's use that if running on Android.
final emulatorHost =
    (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
        ? '10.0.2.2'
        : 'localhost';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   if (USE_DATABASE_EMULATOR) {
    FirebaseDatabase.instance.useDatabaseEmulator(emulatorHost, emulatorPort);
  }
  
  
  
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
      initialRoute: '/',

      routes: {
        '/':(context)=>const HomePage(),
         
        '/SignIn': (context) => const SignInScreen(),
      },
    );
  }

}

