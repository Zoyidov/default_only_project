import 'package:flutter/material.dart';

class Circle extends StatefulWidget {
  final double height;
  final double width;
  final Color color;
  final Color shadowColor;

  const Circle({
    Key? key,
    required this.height,
    required this.width,
    required this.color,
    required this.shadowColor,
  }) : super(key: key);

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
