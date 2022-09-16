import 'dart:async';

import 'package:flutter/material.dart';

class TimerClass extends StatefulWidget {
  const TimerClass({Key? key}) : super(key: key);
  static String pageRoute = "/timer";

  @override
  State<TimerClass> createState() => _TimerClassState();
}

class _TimerClassState extends State<TimerClass> {
  Timer? _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(
            () {
              timer.cancel();
            },
          );
        } else {
          setState(
            () {
              _start--;
            },
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController txt = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: const Text(
          "TIMER",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                  controller: txt,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Colors.purple,
                    labelText: "Second",
                    labelStyle: TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10,
                    ),
                  ),
                  onChanged: (String value) {
                    _start = int.parse(txt.text);
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Empty!";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.purple,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    startTimer();
                  }
                },
                onLongPress: () {
                  setState(
                    () {
                      _timer!.cancel();
                      _start = 0;
                    },
                  );
                },
                child: const Text(
                  "start",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "$_start",
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Hold the Button\nFor Cancel It",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  backgroundColor: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
