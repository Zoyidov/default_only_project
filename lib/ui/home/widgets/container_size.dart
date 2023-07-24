import 'package:flutter/material.dart';

class ContainerSize extends StatefulWidget {
  const ContainerSize({super.key});

  @override
  State<ContainerSize> createState() => _ContainerSizeState();
}

class _ContainerSizeState extends State<ContainerSize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Container Size'),
      ),
      body: const Center(child: LargeAndSmal()),
    );
  }
}

class LargeAndSmal extends StatefulWidget {
  const LargeAndSmal({super.key});

  @override
  State<LargeAndSmal> createState() => _LargeAndSmalState();
}

class _LargeAndSmalState extends State<LargeAndSmal> {
  double _size = 300.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _size = _size == 300 ? 100 : 300;
        });
      },
      child: Container(
        height: 250,
        color: Colors.black,
        child: AnimatedSize(
          curve: Curves.easeIn,
          duration: const Duration(seconds: 1),
          child: Container(
            width: _size,
          ),
        ),
      ),
    );
  }
}
