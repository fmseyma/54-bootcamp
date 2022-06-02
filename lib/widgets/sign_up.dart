import 'package:antello/classes/new_user_informations.dart';
import 'package:antello/screens/questions_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utils/email_auth.dart';
import '../main.dart';

class SignUp extends StatefulWidget {
  final Function(bool, bool) onClickedSignIn;
  const SignUp({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  bool nickvalue = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  TextEditingController isim = TextEditingController(),
      soyisim = TextEditingController(),
      nick = TextEditingController(),

      password1 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextFormField(
                controller: isim,
                validator: (email) =>
                    !(email != null && email != "") ? " Enter a name" : null,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'İsim',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextFormField(
                controller: soyisim,
                validator: (email) =>
                    !(email != null && email != "") ? " Enter a surname" : null,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Soyisim',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextFormField(
                controller: nick,
                validator: (username) {
                  if (!(username != null && username != ""))
                    return " Enter a nickname";
                  if (nickvalue) return "Bu kullanıcı adı alınmış";

                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Kullanıcı Adı',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? " Enter a valid email"
                        : null,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextFormField(
                controller: passwordController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "password"),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (password) => password != null && password.length < 8
                    ? "enter min 8 characters"
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextFormField(
                controller: password1,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "password again"),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (password) =>
                    password != null && password != password1.text
                        ? "iki şifre aynı olmalıdır"
                        : null,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                onPressed: signUp,
                icon: Icon(FontAwesomeIcons.lock),
                label: Text("SignUp")),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                widget.onClickedSignIn(true, false);
              },
              child: const Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF26235C),
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    final database = FirebaseDatabase.instance;
    DatabaseReference messagesRef = database.ref('Users/${nick.text}');
    await messagesRef.once().then((value) {
      nickvalue = value.snapshot.exists;
     if(nickvalue) print("bu kullanıcı adı var");
    });
    final isValid = formKey.currentState!.validate();

    if (nickvalue) return;
    print("bu kullanıcı adı yok");

    if (!isValid) return;

    NewUser.mail=  emailController.text ;
    NewUser.password=  passwordController .text; 
    NewUser.name= isim  .text; 
     NewUser.surname=  soyisim  .text; 
     NewUser.nickname=  nick  .text; 
    showDialog(
        context: context,
        builder: ((context) => Center(
              child: CircularProgressIndicator(),
            )));
    try {
    late  User k;  
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim()).then((value) => k=value.user!);



              Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => QuestionsPage(
              user :k
            ),
          ),
        );
    } on FirebaseAuthException catch (e) {
      print(e);
      Email.showSnackBar(e.message);
    }
 
  }
}
