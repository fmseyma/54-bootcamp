import 'package:antello/classes/app_user.dart';
import 'package:antello/scaffold/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/user_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState

    
    super.initState();
  }

  int tabindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationWidget( gopage: goPage, currentIndex: tabindex,)
,
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserChart(
              appUser: AppUser(ad: "Yusuf", soyad: "ÖZil", bio: "slkflksd"),
            ),
           
          ],
        ),
      )),
    );
  }

  
  goPage(int page){
    print("şu sayfaya geçildi $page");
    tabindex= page;


  
}
}

