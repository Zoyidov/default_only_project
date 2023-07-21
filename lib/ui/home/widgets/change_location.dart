import 'package:flutter/material.dart';

class ChangeLocationScreen extends StatefulWidget {
  const ChangeLocationScreen({Key? key}) : super(key: key);

  @override
  State<ChangeLocationScreen> createState() => _ChangeLocationScreenState();
}

class _ChangeLocationScreenState extends State<ChangeLocationScreen> {
  int selected = 0;
  double containerX = 0;
  double containerY = 0;

  void _changePosition(String direction) {
    setState(() {
      switch (direction) {
        case 'up':
          containerY = -155;
          containerX = 0;
          break;
        case 'down':
          containerY = 120;
          containerX = 0;
          break;
        case 'left':
          containerX = -100;
          containerY = 0;
          break;
        case 'right':
          containerX = 100;
          containerY = 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Change color"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Center(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      height: 150,
                      width: 150,
                      curve: Curves.linear,
                      duration: const Duration(seconds: 2),
                      transform:
                          Matrix4.translationValues(containerX, containerY, 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
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
            onPressed: () => _changePosition('up'),
            backgroundColor: Colors.black,
            child: Icon(Icons.keyboard_arrow_up, size: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () => _changePosition('left'),
                backgroundColor: Colors.black,
                child: Icon(Icons.keyboard_arrow_left, size: 40),
              ),
              FloatingActionButton(
                onPressed: () => _changePosition('right'),
                backgroundColor: Colors.black,
                child: Icon(Icons.keyboard_arrow_right, size: 40),
              ),
            ],
          ),
          FloatingActionButton(
            onPressed: () => _changePosition('down'),
            backgroundColor: Colors.black,
            child: Icon(Icons.keyboard_arrow_down, size: 40),
          ),
        ],
      ),
    );
  }
}
