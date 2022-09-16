import 'package:flutter/material.dart';

class Ex extends StatefulWidget {
  const Ex({Key? key}) : super(key: key);
  static String pageRoute = "/ex";

  @override
  State<Ex> createState() => _ExState();
}

class _ExState extends State<Ex> {
  double _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        title: const Text(
          "SPORT",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    if (_opacity == 0.0) {
                      _opacity = 1.0;
                    } else {
                      _opacity = 0.0;
                    }
                  },
                );
              },
              child: const Text(
                "Show",
                style: TextStyle(fontSize: 30),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: Colors.purple,
              ),
            ),
            Expanded(
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 1),
                child: ListView(
                  children: <Widget>[
                    sport("assets/images/one.jpg"),
                    const SizedBox(
                      height: 10,
                    ),
                    sport("assets/images/eight.jpg"),
                    const SizedBox(
                      height: 10,
                    ),
                    sport("assets/images/five.jpg"),
                    const SizedBox(
                      height: 10,
                    ),
                    sport("assets/images/four.jpg"),
                    const SizedBox(
                      height: 10,
                    ),
                    sport("assets/images/nine.png"),
                    const SizedBox(
                      height: 10,
                    ),
                    sport("assets/images/seven.jpg"),
                    const SizedBox(
                      height: 10,
                    ),
                    sport("assets/images/six.jpg"),
                    const SizedBox(
                      height: 10,
                    ),
                    sport("assets/images/ten.png"),
                    const SizedBox(
                      height: 10,
                    ),
                    sport("assets/images/two.jpg"),
                    const SizedBox(
                      height: 10,
                    ),
                    sport("assets/images/three.jpg"),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget sport(String img) {
  return Container(
    width: 230.0,
    height: 200.0,
    color: Colors.purple,
    child: Image.asset(img),
  );
}
