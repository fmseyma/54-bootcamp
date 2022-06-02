import 'package:antello/screens/home_page.dart';
import 'package:antello/screens/questions_page.dart';
import 'package:antello/themes/app_colors.dart';
import 'package:antello/widgets/purple_button.dart';
import 'package:antello/widgets/push_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../classes/app_user.dart';
import '../utils/authentication.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/google_sign_in_button.dart';
import '../widgets/login_widget.dart';
import '../widgets/sign_up.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

bool yenibool = false;

class _SignInScreenState extends State<SignInScreen> {
  bool bekleyecekmiyiz = true;

  @override
  void initState() {
    print("sign in screen");

    FirebaseAuth.instance.authStateChanges().listen((User? user) async{
      
      if (user == null) {
        setState(() {
          bekleyecekmiyiz = false;
        });
        debugPrint('User is currently signed out!');
      } else {

  //       UserMAnagement.fromUid(user.uid).then((value) {

  //         if(value.department!=""){
  //               Navigator.of(context).pushNamed("/");
             
  //         }else {
  // Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => QuestionsPage(
  //             user: user,
  //           ),
  //         ),
  //       );
  //         }
  //       });
      

        print('User is signed in!');
      }
    });

    super.initState();
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  bool signin = false, signup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                      Image(
                        image:  AssetImage("assets/icon.png"),
                        width: 200.0,
                      ),
                  const SizedBox(height: 80),
                
                          // SizedBox (width:250,height: 250,child: Image.asset("assets/icon.png")),
                          //    const Expanded(child: Text(""),),
                       
                        
              !signin ? Text(""):    LoginWidget(
                    onclickedSignUp: toggle,
                  ),
               !signup ? Text(""):    SignUp(
                    onClickedSignIn: toggle,
                  ),
                signin || signup ? Text(""):     PushButton(
                            backgroundColor: AppColors.purple,
                            butonyazisi: "Giriş Yap",
                            function: () {
                              setState(() {
                                signin = true;
                                signup=false;
                              });
                            },
                          ),
                          const SizedBox(height: 10),

                signup||signin ? Text(""):          PushButton(
                            textColor: AppColors.purple,
                            backgroundColor: AppColors.background,
                            butonyazisi: "Kayıt Ol",
                            function: () {
                              setState(() {
                                signin=false;

                              signup = true;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                  
                  // FutureBuilder(
                  //   future: Authentication.initializeFirebase(context: context),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasError) {
                  //       return const Text('Error initializing Firebase');
                  //     } else {
                  //       return GoogleSignInButton(
                  //         const Key("GoogleSignInButton"),
                  //         girildimi: bekleyecekmiyiz,
                  //       );
                  //     }
                  //   },
                  // ),
                
                  InkWell(
                    onTap: () {
                      _launchInBrowser(Uri(
                          scheme: 'https',
                          host: 'antello.firebaseapp.com',
                          path: ''));
                    },
                    child: const Text(
                      "Gizlilik Politikası",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toggle(bool sin, bool up) => setState(() {
    signin=sin;
    signup=up;
  });
}
