import 'package:flutter/material.dart';

class MyTheme extends StatefulWidget {
  const MyTheme({Key? key}) : super(key: key);
  static String pageRoute = "/theme";

  @override
  State<MyTheme> createState() => _MyThemeState();
}

class _MyThemeState extends State<MyTheme> {
  @override
  Widget build(BuildContext context) {
    //stream method
    int count = 15;
    Stream<int> myData() async* {
      while (count >= -1) {
        await Future.delayed(
          const Duration(seconds: 1),
        );
        yield count--;
        if (count == -1) {
          Navigator.pop(context);
        }
      }
    }

    Widget sBuilder() {
      return StreamBuilder(
        stream: myData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Widget> myChildren;

          if (snapshot.hasData) {
            myChildren = [
              Icon(
                Icons.timelapse_outlined,
                size: 100.0,
                color: Colors.purple,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "You'll out in: ${snapshot.data}",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ];
          } else {
            myChildren = [
              SizedBox(
                child: CircularProgressIndicator(),
                height: 100.0,
                width: 100.0,
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: myChildren,
            ),
          );
        },
      );
    }

    //future method
    Future<String> data = Future.delayed(
      const Duration(
        seconds: 5,
      ),
      () => "Coming Soon...",
    );

    Widget fBuilder() {
      return FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100.0,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  " Data   Loaded ",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Data: ${snapshot.data}",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 120.0,
              ),
              sBuilder(),
            ];
          } else if (snapshot.hasError) {
            children = [
              const Icon(
                Icons.error_outline_sharp,
                size: 100.0,
                color: Colors.red,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "  Faild  ",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "Data: ${snapshot.error}",
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ];
          } else {
            children = [
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: CircularProgressIndicator(),
              ),
              const Padding(
                padding: EdgeInsets.all(
                  20.0,
                ),
                child: Text(
                  "Loading...",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: fBuilder(),
    );
  }
}
