import 'dart:async';
import 'package:flutter/material.dart';

class StopW extends StatefulWidget {
  const StopW({Key? key}) : super(key: key);
  static String pageRoute = "/stopw";

  @override
  State<StopW> createState() => _TimerState();
}

class _TimerState extends State<StopW> {
  bool flag = true;
  Stream<int>? timerStream;
  StreamSubscription<int>? timerSubscription;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';
  Stream<int> stopWatchStream() {
    StreamController<int>? streamController;
    Timer? timer;
    Duration timerInterval = const Duration(seconds: 1);
    int counter = 0;

    void stopTimer() {
      if (timer != null) {
        timer!.cancel();
        timer = null;
        counter = 0;
        streamController!.close();
      }
    }

    void tick(_) {
      counter++;
      streamController!.add(counter);
      if (!flag) {
        stopTimer();
      }
    }

    void startTimer() {
      timer = Timer.periodic(timerInterval, tick);
    }

    streamController = StreamController<int>(
      onListen: startTimer,
      onCancel: stopTimer,
      onResume: startTimer,
      onPause: stopTimer,
    );

    return streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: const Text(
          "STOP WATCH",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$hoursStr:$minutesStr:$secondsStr",
              style: const TextStyle(
                fontSize: 90.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  onPressed: () {
                    timerStream = stopWatchStream();
                    timerSubscription = timerStream!.listen(
                      (int newTick) {
                        setState(
                          () {
                            hoursStr = ((newTick / (60 * 60)) % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                            minutesStr = ((newTick / 60) % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                            secondsStr = (newTick % 60)
                                .floor()
                                .toString()
                                .padLeft(2, '0');
                          },
                        );
                      },
                    );
                  },
                  color: Colors.green,
                  child: const Text(
                    'START',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(width: 40.0),
                MaterialButton(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  onPressed: () {
                    timerSubscription!.cancel();
                    timerStream = null;
                    setState(
                      () {
                        hoursStr = '00';
                        minutesStr = '00';
                        secondsStr = '00';
                      },
                    );
                  },
                  color: Colors.red,
                  child: const Text(
                    'RESET',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
