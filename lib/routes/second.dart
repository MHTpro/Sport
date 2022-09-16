import 'package:flutter/material.dart';
import 'third.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);
  static String pageRoute = "/reg";

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute>
    with SingleTickerProviderStateMixin {
  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  //
  String value1 = "";
  String value2 = "";

  late Animation<double> _animation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      value: 0.0,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.slowMiddle,
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Text(
          "Registration Form".toUpperCase(),
          style: const TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    onChanged: (value) {
                      value1 = fName.text;
                    },
                    controller: fName,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: Colors.purple,
                      hintText: "First name",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white54,
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "can't be Empty!";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    onChanged: (value) {
                      value2 = lName.text;
                    },
                    controller: lName,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: Colors.purple,
                      hintText: "last name",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white54,
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "can't be Empty!";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              RotationTransition(
                turns: _animation,
                child: FadeTransition(
                  opacity: _animation,
                  child: Icon(
                    Icons.draw,
                    size: 90,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      ThirdRoute.pageRoute,
                      arguments: <String, String>{
                        "one": value1,
                        "two": value2,
                      },
                    );
                  }
                },
                child: const Text(
                  "Next",
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
