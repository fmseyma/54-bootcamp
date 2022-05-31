import 'package:antello/screens/questions_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import "package:http/http.dart" as http;


class Authentication {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.white, letterSpacing: 0.5),
      ),
    );
  }

  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context,
  }) async {
   
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => QuestionsPage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }
   static GoogleSignInAccount? sign = GoogleSignIn( scopes: [
    //    "https://www.googleapis.com/auth/drive.file",
    //    "https://www.googleapis.com/auth/drive.readonly",
    // "https://www.googleapis.com/auth/documents"
        ]).currentUser;
  // static Future<GoogleSignInAccount?> sign(){
  //   final GoogleSignIn googleSignIn = GoogleSignIn(
  //       scopes: [
  //      "https://www.googleapis.com/auth/drive.file",
  //      "https://www.googleapis.com/auth/documents"
  //       ]
  //     );
    // final GoogleSignInAccount? googleSignInAccount =
  //      return  googleSignIn.signIn();
  // }
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
                              await Authentication.signOut(context: context);
    
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

 
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      print("Scope girrildi");
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
    //       "https://www.googleapis.com/auth/drive.file",
    //    "https://www.googleapis.com/auth/drive.readonly",
    // "https://www.googleapis.com/auth/documents"
       
        ]
      );

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
          
    
           
           
      if (googleSignInAccount != null) {
        var headers =await googleSignInAccount.authHeaders;
        print( "headers: ${headers.entries.first.value}");

      //         final SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setStringList("HeadersKey", headers.keys.toList()  );
      
      // prefs.setStringList("HeadersValue",headers.values.toList()).then((bool success) {
      //   return debugPrint(" tercihleri gönder fonksiyonu aktif yazıldı");
      // });

        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content:
                    'The account already exists with a different credential',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content:
                    'Kimlik bilgilerine erişilirken hata oluştu. Tekrar deneyin',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred using Google Sign In. Try again.',
            ),
          );
        }
      }
    }

    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}

class GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;
  final _client = http.Client();

  GoogleAuthClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(_headers);
    return _client.send(request);
  }
}