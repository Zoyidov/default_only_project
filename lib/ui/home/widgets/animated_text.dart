import 'package:flutter/material.dart';

class Animated_Text extends StatefulWidget {
  const Animated_Text({super.key});

  @override
  State<Animated_Text> createState() => _Animated_TextState();
}

class _Animated_TextState extends State<Animated_Text> {
  bool _first = true;
  double _fontSize = 40;
  Color _color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Animted Text'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 900),
                style: TextStyle(
                    fontSize: _fontSize,
                    color: _color,
                    fontWeight: FontWeight.bold),
                child: const Text('The Flutter'),
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _fontSize = 60;
                      _color = Colors.red;
                      _first = !_first;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black,
                    ),
                    child: const Icon(Icons.play_circle_rounded,color: Colors.white,),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _fontSize = 40;
                      _color = Colors.black;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black,
                    ),
                    child: const Icon(Icons.settings_backup_restore,color: Colors.white,),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
