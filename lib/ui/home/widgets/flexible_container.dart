import 'package:flutter/material.dart';

class FlexibleContainer extends StatefulWidget {
  const FlexibleContainer({super.key});

  @override
  State<FlexibleContainer> createState() => _FlexibleContainerState();
}

class _FlexibleContainerState extends State<FlexibleContainer> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation colorAnimation;
  bool isChanged = false;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    colorAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.red,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Flexibility"),
      ),
      body: Center(
        child: AnimatedContainer(
          height: isChanged ? 300 : 100,
          width: isChanged ? 300 : 100,
          duration: const Duration(seconds: 3),
          curve: Curves.linear,
          color: Colors.black,
          child: const Center(
              child: Text(
            "Flutter is the Best",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.normal),
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
          onPressed: () {
            isChanged = !isChanged;
          },
          child: Icon(
            Icons.back_hand,
          )),
    );
  }
}
