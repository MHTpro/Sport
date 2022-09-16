import 'package:flutter/material.dart';
import 'routes/first.dart';
import 'routes/second.dart';
import 'routes/third.dart';
import 'routes/fourth.dart';
import 'routes/exercising.dart';
import 'routes/timer.dart';
import 'routes/stopw.dart';
import 'routes/water.dart';
import 'popup_button/profile.dart';
import 'popup_button/edit.dart';
import 'popup_button/theme.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  FirstRoute.pageRoute: (context) => const FirstRoute(),
  SecondRoute.pageRoute: (context) => const SecondRoute(),
  ThirdRoute.pageRoute: (context) => const ThirdRoute(),
  FourthRoute.pageRoute: (context) => const FourthRoute(),
  Ex.pageRoute: (context) => const Ex(),
  StopW.pageRoute: (context) => const StopW(),
  TimerClass.pageRoute: (context) => const TimerClass(),
  Water.pageRoute: (context) => const Water(),
  Profile.pageRoute: (context) => const Profile(),
  About.pageRoute: (context) => const About(),
  MyTheme.pageRoute: (context) => const MyTheme(),
};
