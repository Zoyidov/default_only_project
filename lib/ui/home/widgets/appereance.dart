import 'package:flutter/material.dart';

class Appereance extends StatefulWidget {
  const Appereance({
    super.key,
  });

  @override
  State<Appereance> createState() => _AppereanceState();
}


class _AppereanceState extends State<Appereance> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Appereance'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.apple),
      ),
    );
  }
}