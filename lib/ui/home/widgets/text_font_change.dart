import 'package:flutter/material.dart';

class TextFontChange extends StatefulWidget {
  const TextFontChange({Key? key}) : super(key: key);

  @override
  _TextFontChangeState createState() => _TextFontChangeState();
}

class _TextFontChangeState extends State<TextFontChange> {
  bool _first = true;
  double _fontSize = 40;
  Color _color = Colors.indigo;
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("TextFontChange"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 210,
              child: AnimatedDefaultTextStyle(
                curve: Curves.bounceOut,
                duration: const Duration(milliseconds: 350),
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _color,
                  fontWeight: FontWeight.bold,
                ),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text("Flutter Dev's"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    _fontSize = _first ? 60 : 40;
                    _color = _first ? Colors.blue : Colors.brown;
                    _first = !_first;
                    _height = _first ? 100 : 130;
                  });
                },
                child: const Text(
                  "Click Here!!",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}