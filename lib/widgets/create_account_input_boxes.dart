import 'package:antello/classes/new_user_informations.dart';
import 'package:antello/widgets/push_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAccountInputBoxesWidget extends StatefulWidget {
  const CreateAccountInputBoxesWidget({Key? key}) : super(key: key);

  @override
  State<CreateAccountInputBoxesWidget> createState() =>
      _CreateAccountInputBoxesWidgetState();
}

class _CreateAccountInputBoxesWidgetState
    extends State<CreateAccountInputBoxesWidget> {
  TextEditingController isim = TextEditingController(),
      soyisim = TextEditingController(),
      nick = TextEditingController(),
      mail = TextEditingController(),
      password = TextEditingController(),
      password1 = TextEditingController();

      
  @override
  void initState() {
    isim.addListener(() {
      NewUser.name = isim.text;
    });
    soyisim.addListener(() {
      NewUser.surname = soyisim.text;
    });
    mail.addListener(() {
      NewUser.mail = mail.text;
    });
    nick.addListener(() {
      NewUser.nickname = nick.text;
    });
    password.addListener(() {
      NewUser.password = password.text;
    });

    super.initState();
  }

  @override
  void dispose() {
    isim.dispose();
    soyisim.dispose();
    mail.dispose();
    nick.dispose();
    password.dispose();
    password1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TextFormField(
            controller: isim,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'İsim',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TextFormField(
            controller:soyisim,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Soyisim',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TextFormField(
            controller:nick,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Kullanıcı Adı',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TextFormField(
            controller: mail,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'E-posta',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TextFormField(
            controller: password,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Şifre',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: TextFormField(
            controller: password1,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Şifre Onay',
            ),
          ),
        ),
      ],
    );
  }
}
