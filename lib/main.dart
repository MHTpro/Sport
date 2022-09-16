import 'package:flutter/material.dart';
import 'routes.dart';
import 'routes/first.dart';
import 'custom_transition/custom_transition.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirstRoute.pageRoute,
      routes: routes,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeRotation(),
          },
        ),
      ),
    );
  }
}
