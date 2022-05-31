import 'package:antello/widgets/profile_widget.dart';
import "package:flutter/material.dart";
import '../widgets/profile_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFF7F7FC),
      appBar: ProfileAppBar(context),
      body:const ProfileWidget(),
    );
  }
}
