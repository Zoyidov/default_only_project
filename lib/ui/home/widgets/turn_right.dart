import 'dart:math';
import 'package:flutter/material.dart';

class TurnToRight extends StatefulWidget {
  const TurnToRight({Key? key}) : super(key: key);

  @override
  State<TurnToRight> createState() => _TurnToRightState();
}

class _TurnToRightState extends State<TurnToRight>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 2 * pi).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.easeOut,
    ))
      ..addListener(() {
        setState(() {});
      });

    animationController.repeat(reverse: false);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Turn to Right"),
      ),
      body: Center(
        child: Transform.rotate(
            angle: animation.value,
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(border: Border.all(color: Colors.black,)),
            )),
      ),
    );
  }
}
