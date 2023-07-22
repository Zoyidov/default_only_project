import 'dart:math';

import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    animationController.addListener(() {
      setState(() {});
    });
    animation = Tween<double>(begin: 25, end: pi).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn));
    super.initState();
  }

  void _startRotationAnimation() {
    if (animationController.isAnimating) {
      animationController.stop();
    }
    animationController.reset();
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200, left: 90, right: 90),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Transform.rotate(
                angle: animation.value,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: FlutterLogo(
                        size: 90,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FlutterLogo(
                        size: 90,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlutterLogo(
                        size: 90,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FlutterLogo(
                        size: 90,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30)),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: _startRotationAnimation,
          child: Icon(Icons.play_arrow,size: animation.value,),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
