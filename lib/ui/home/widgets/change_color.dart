import 'package:flutter/material.dart';

class ChangeColorScreen extends StatefulWidget {
  const ChangeColorScreen({Key? key}) : super(key: key);

  @override
  State<ChangeColorScreen> createState() => _ChangeColorScreenState();
}

class _ChangeColorScreenState extends State<ChangeColorScreen> {
  int selected = 0;

  final List<Color> colors = [
    Colors.green,
    Colors.orange,
  ];

  final List<String> text = ['Green', 'Orange'];

  void _changeColor() {
    setState(() {
      selected = (selected + 1) % colors.length;
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
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black),shape: BoxShape.circle),
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        height: 150,
                        width: 150,
                        curve: Curves.linear,
                        duration: const Duration(seconds: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors[selected],
                        ),
                        child: Center(
                          child: Text(
                            text[selected],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
            onPressed: _changeColor,
            backgroundColor: Colors.black,
            child: Icon(Icons.color_lens, size: 40),
          ),
        ],
      ),
    );
  }
}
