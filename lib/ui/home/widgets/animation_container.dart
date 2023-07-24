import 'package:flutter/material.dart';

class Animation_Container extends StatefulWidget {
  const Animation_Container({super.key});

  @override
  State<Animation_Container> createState() => _Animation_ContainerState();
}

class _Animation_ContainerState extends State<Animation_Container> with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      border: Border.all(color: Colors.black, width: 1),
      borderRadius: BorderRadius.circular(100.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0),
        ),
      ],
    ),
    end: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(0.0),
      border: Border.all(color: Colors.black, width: 10),

      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 5.0,
          spreadRadius: 1.0,
          offset: Offset(0, 3.0),
        ),
      ],

      // No shadow.
    ),
  );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
  late final AnimationController _controller2 = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Animation_Container"),
      ),
      body: ColoredBox(
        color: Colors.white,
        child: Center(
          child: DecoratedBoxTransition(
            decoration: decorationTween.animate(_controller),
            child: Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}