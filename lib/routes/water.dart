import 'package:flutter/material.dart';

class Water extends StatefulWidget {
  const Water({Key? key}) : super(key: key);
  static const pageRoute = "/water";

  @override
  State<Water> createState() => _WaterState();
}

class _WaterState extends State<Water> {
  int glass = 0;
  bool select = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: const Text(
          "WATER",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPadding(
              curve: Curves.slowMiddle,
              padding: select
                  ? const EdgeInsets.symmetric(horizontal: 100)
                  : const EdgeInsets.symmetric(horizontal: 150),
              duration: const Duration(seconds: 1),
              child: Container(
                width: 250,
                height: 200,
                child: const Icon(
                  Icons.local_drink,
                  color: Colors.black54,
                  size: 60,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Glass of Water",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.purple[200],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "$glass",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.purple[200],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (glass != 0) {
                      setState(
                        () {
                          glass--;
                          select = false;
                        },
                      );
                    }
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        glass++;
                        select = true;
                      },
                    );
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
