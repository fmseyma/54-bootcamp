import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  void Function(int) gopage;
  int currentIndex;
  BottomNavigationWidget(
      {Key? key, required this.gopage, required this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          gopage(value);
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: "Keşet",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer, color: Colors.black),
              label: "Soru Tahtası"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat, color: Colors.black),
               label: "Sohbet"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
               label: "Hesap"),
        ]);
  }
}
