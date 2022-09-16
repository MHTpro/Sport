import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PopupMenuEntry<String>> myItem = [
    PopupMenuItem(
      child: Text("Profile"),
      value: "0",
    ),
    const PopupMenuItem(
      child: Text("theme"),
      value: "1",
    ),
    const PopupMenuItem(
      child: Text("About"),
      value: "2",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Map value = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: const Text(
          "HOME",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (result) {
              if (result == "0") {
                Navigator.pushNamed(
                  context,
                  "/profile",
                  arguments: value,
                );
              }
              if (result == "1") {
                Navigator.pushNamed(context, "/theme");
              }
              if (result == "2") {
                Navigator.pushNamed(context, "/about");
              }
            },
            itemBuilder: (BuildContext context) {
              return myItem;
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            InkResponse(
              onTap: () {
                Navigator.pushNamed(context, "/ex");
              },
              child: Container(
                alignment: Alignment.center,
                height: 140,
                width: 310,
                decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.purple,
                      offset: Offset(-1, 1),
                      spreadRadius: 10,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white,
                    width: 2.5,
                  ),
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Icon(
                      Icons.sports_martial_arts_outlined,
                      size: 70,
                      color: Colors.white,
                    ),
                    Text(
                      "Start Exercising",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkResponse(
                  onTap: () {
                    Navigator.pushNamed(context, "/stopw");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.purple,
                          offset: Offset(-1, 1),
                          spreadRadius: 3,
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white,
                        width: 2.5,
                      ),
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.timer,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          "Stop\nWatch",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkResponse(
                  onTap: () {
                    Navigator.pushNamed(context, "/timer");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 180,
                    decoration: BoxDecoration(
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          blurRadius: 10.0,
                          color: Colors.purple,
                          offset: Offset(-1, 1),
                          spreadRadius: 3,
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white,
                        width: 2.5,
                      ),
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        Icon(
                          Icons.av_timer_outlined,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          "Timer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkResponse(
              onTap: () {
                Navigator.pushNamed(context, "/water");
              },
              child: Container(
                alignment: Alignment.center,
                height: 140,
                width: 310,
                decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.purple,
                      offset: Offset(-1, 1),
                      spreadRadius: 10,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.white,
                    width: 2.5,
                  ),
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Icon(
                      Icons.local_drink_rounded,
                      size: 70,
                      color: Colors.white,
                    ),
                    Text(
                      "Water",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
