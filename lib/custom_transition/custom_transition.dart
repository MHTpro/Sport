import 'package:flutter/material.dart';

class FadeRotation extends PageTransitionsBuilder {
  const FadeRotation();
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return _FadeRotation(
      animation: animation,
      child: child,
    );
  }
}

class _FadeRotation extends StatelessWidget {
  _FadeRotation({
    Key? key,
    required Animation<double> animation,
    required Widget this.child,
  })  : animation = animation.drive(
          CurveTween(
            curve: Curves.slowMiddle,
          ),
        ),
        super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
