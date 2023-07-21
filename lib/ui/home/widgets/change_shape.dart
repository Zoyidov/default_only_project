import 'package:flutter/material.dart';

class ChangeShapeScreen extends StatefulWidget {
  const ChangeShapeScreen({super.key});

  @override
  State<ChangeShapeScreen> createState() => _ChangeShapeScreenState();
}

class _ChangeShapeScreenState extends State<ChangeShapeScreen>
    with TickerProviderStateMixin {
  int selected = 0;

  late Animation colorAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    colorAnimation = ColorTween(
      begin: Color(0xFF76FF03),
      end: Color(0xFF512DA8),
    ).animate(controller);

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: false);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Change shape"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        height: selected == 0
                            ? 100
                            : selected == 1
                                ? 300
                                : selected == 2
                                    ? 200
                                    : 350,
                        width: selected == 0
                            ? 100
                            : selected == 1
                                ? 50
                                : selected == 2
                                    ? 250
                                    : 150,
                        curve: Curves.linear,
                        duration: const Duration(seconds: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorAnimation.value,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          FloatingActionButton(
            onPressed: () {
              if (selected == 3) {
                setState(() {
                  selected = 0;
                });
              } else {
                setState(() {
                  selected++;
                });
              }
            },
            backgroundColor: Colors.black,
            child: Icon(
              Icons.color_lens,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
