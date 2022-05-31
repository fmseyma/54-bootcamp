import 'package:antello/classes/app_user.dart';
import 'package:antello/scaffold/bottom_navigation_bar.dart';
import 'package:antello/tabs/explore_tab.dart';
import 'package:antello/tabs/match_tab.dart';
import 'package:antello/tabs/profile_tab.dart';
import 'package:antello/themes/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../tabs/chat_tab.dart';
import '../widgets/user_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with TickerProviderStateMixin  {
  late TabController controller;
  User? _user;

  @override
  void initState() {
    // TODO: implement initState

    controller= TabController(length: 4, vsync: this);
      FirebaseAuth.instance.authStateChanges().listen((User? user) async{
      
      if (user == null) {
      
        debugPrint('User is currently signed out!');
      } else {
        UserMAnagement.fromUid(user.uid).then((value) {
          if(value.birthDate!=""){
                Navigator.of(context).pushNamed("Home");
             
          }else {
              _user=user;
          }
        });
      

        print('User is signed in!');
      }
    });

   
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  int tabindex=0;
  List<Widget> tabs =[ExploreTab(),MatchTab(),ChatTab(),ProfileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationWidget( gopage: goPage, currentIndex: tabindex,)
,
      body: TabBarView( controller: controller, children: tabs,) );
  }

  
  goPage(int page){
    print("şu sayfaya geçildi $page");
    
    setState(() {
       tabindex= page;
    });

    controller.animateTo(page, duration: Duration(milliseconds:200));
    if(page==3){
    Navigator.of(context).pushNamed("SignIn");

    }




  
}
}

