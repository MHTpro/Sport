import 'package:flutter/material.dart';
import 'home.dart';
import 'contact.dart';

class FourthRoute extends StatefulWidget {
  const FourthRoute({Key? key}) : super(key: key);
  static String pageRoute = "/main";

  @override
  State<FourthRoute> createState() => _FourthRouteState();
}

class _FourthRouteState extends State<FourthRoute> {
  List<BottomNavigationBarItem> navPage = [
    const BottomNavigationBarItem(
      backgroundColor: Colors.purple,
      label: "home",
      icon: Icon(Icons.home),
    ),
    const BottomNavigationBarItem(
      backgroundColor: Colors.purple,
      label: "contact us",
      icon: Icon(Icons.person),
    ),
  ];

  List<Widget> myPage = [
    const HomePage(),
    const ContactPage(),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: myPage.elementAt(selected),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: navPage,
        backgroundColor: Colors.purple,
        elevation: 5,
        iconSize: 35,
        fixedColor: Colors.white,
        currentIndex: selected,
        onTap: (int index) {
          setState(
            () {
              selected = index;
            },
          );
        },
      ),
    );
  }
}
