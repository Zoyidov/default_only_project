import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/colors.dart';

class Level extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final double width;

  const Level({
    Key? key,
    required this.text,
    required this.onTap,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> {
  double scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          scaleFactor = 0.95;
        });
      },
      onTapUp: (_) {
        setState(() {
          scaleFactor = 1.0;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          scaleFactor = 1.0;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(55),
          boxShadow: [
            BoxShadow(
              color: AppColors.C_5200FF.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 30,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          height: widget.height,
          width: widget.width,
          transform: Matrix4.identity()..scale(scaleFactor),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(55),
            border: Border.all(color: AppColors.C_7000FF),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
