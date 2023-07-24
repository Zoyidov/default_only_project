import 'package:flutter/material.dart';

class AnimationEighthScreen extends StatefulWidget {
  const AnimationEighthScreen({super.key});

  @override
  State<AnimationEighthScreen> createState() => _AnimationEighthScreenState();
}

class _AnimationEighthScreenState extends State<AnimationEighthScreen> {
  late AnimationController animationController;

  bool _isAnimation = false;

  void dispose() {
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text('Animated Delation')),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(120),
          height: 400,
          color: Colors.black,
          child: AnimatedAlign(
              alignment:
                  _isAnimation ? Alignment.topLeft : Alignment.bottomRight,
              curve: Curves.bounceIn,
              duration: const Duration(seconds: 2),
              child: const Text('The Flutter',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),)),
        ),
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _isAnimation = !_isAnimation;
        });
      },
        backgroundColor: Colors.black,
        child: Icon(Icons.apple),
      ),
    );
  }
}
