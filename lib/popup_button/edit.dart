import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);
  static String pageRoute = "/about";

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    Widget createVersion(String txt) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          bottom: 10.0,
          left: 50.0,
          right: 50.0,
        ),
        child: Container(
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 100,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.purple,
            title: const Text(
              "Version\nCurrent:3.2.0",
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 100.0,
                    right: 100.0,
                  ),
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/icon.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                createVersion("V 3.2.0"),
                createVersion("V 3.1.5"),
                createVersion("V 3.0.0"),
                createVersion("V 2.6.0"),
                createVersion("V 2.3.9"),
                createVersion("V 2.2.0"),
                createVersion("V 2.0.1"),
                createVersion("V 1.7.1"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
