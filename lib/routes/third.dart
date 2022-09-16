import 'package:flutter/material.dart';
import 'fourth.dart';

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({Key? key}) : super(key: key);
  static String pageRoute = "/weak";

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  bool myValue = false;
  bool myValue2 = false;
  bool myValue3 = false;
  bool myValue4 = false;
  bool myValue5 = false;
  bool myValue6 = false;
  bool myValue7 = false;
  @override
  Widget build(BuildContext context) {
    Map value = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          '${value["one"]}_${value["two"]}',
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Select DAYs that\nyou are free",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white24,
                  decorationStyle: TextDecorationStyle.wavy,
                  decorationThickness: 30,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CheckboxListTile(
                value: myValue,
                onChanged: (bool? value) {
                  setState(
                    () {
                      myValue = value!;
                    },
                  );
                },
                title: const Text(
                  "Saturday",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.purple,
              ),
              CheckboxListTile(
                value: myValue2,
                onChanged: (bool? value) {
                  setState(
                    () {
                      myValue2 = value!;
                    },
                  );
                },
                title: const Text(
                  "Sunday",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.purple,
              ),
              CheckboxListTile(
                value: myValue3,
                onChanged: (bool? value) {
                  setState(
                    () {
                      myValue3 = value!;
                    },
                  );
                },
                title: const Text(
                  "Monday",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.purple,
              ),
              CheckboxListTile(
                value: myValue4,
                onChanged: (bool? value) {
                  setState(
                    () {
                      myValue4 = value!;
                    },
                  );
                },
                title: const Text(
                  "Tuesday",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.purple,
              ),
              CheckboxListTile(
                value: myValue5,
                onChanged: (bool? value) {
                  setState(
                    () {
                      myValue5 = value!;
                    },
                  );
                },
                title: const Text(
                  "Wednesday",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.purple,
              ),
              CheckboxListTile(
                value: myValue6,
                onChanged: (bool? value) {
                  setState(
                    () {
                      myValue6 = value!;
                    },
                  );
                },
                title: const Text(
                  "Thursday",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.purple,
              ),
              CheckboxListTile(
                value: myValue7,
                onChanged: (bool? value) {
                  setState(
                    () {
                      myValue7 = value!;
                    },
                  );
                },
                title: const Text(
                  "Friday",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                activeColor: Colors.purple,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    FourthRoute.pageRoute,
                    arguments: value,
                  );
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  elevation: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
