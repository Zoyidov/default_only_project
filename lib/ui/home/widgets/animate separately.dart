import 'dart:math';

import 'package:flutter/material.dart';

class AnimateSeparately extends StatefulWidget {
  const AnimateSeparately({Key? key}) : super(key: key);

  @override
  State<AnimateSeparately> createState() => _AnimateSeparatelyState();
}

class _AnimateSeparatelyState extends State<AnimateSeparately>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );
    animationController.addListener(() {
      setState(() {});
    });
    animation = Tween<double>(begin: 0, end: 2 * pi).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
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
        padding: const EdgeInsets.only(top: 200, left: 50, right: 50),
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: Transform.rotate(
                angle: animation.value,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Transform.rotate(
                          angle: -animation.value,
                          child: Icon(Icons.apple,size: 90,color: Colors.white,)
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.rotate(
                          angle: -animation.value,
                          child: Icon(Icons.apple,size: 90,color: Colors.white,)
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform.rotate(
                          angle: -animation.value,
                          child: Icon(Icons.apple,size: 90,color: Colors.white,)
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform.rotate(
                          angle: -animation.value,
                          child: Icon(Icons.apple,size: 90,color: Colors.white,)
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
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: _startRotationAnimation,
          child: Icon(
            Icons.play_arrow,
            size: 30,
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
