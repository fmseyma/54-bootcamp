import 'package:antello/classes/app_user.dart';
import 'package:antello/widgets/user_chart.dart';
import 'package:flutter/material.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({ Key? key }) : super(key: key);

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  
  List<Widget> userCharts(int s){
    List<Widget> _i = [];
    for(var i in UserMAnagement.allusers){
      _i.add(UserChart(appUser: i));

    }
    // while(_i.length<s){
    //   _i.add(UserChart(appUser: UserMAnagement.sampleUser));
      
    // }
    
    return _i;
  }
  @override
  void initState() {
    // TODO: implement initState
    UserMAnagement.randomUser(5).then((value) => setState(() {
      
    },));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: userCharts(5) ,),
    );
  }
}