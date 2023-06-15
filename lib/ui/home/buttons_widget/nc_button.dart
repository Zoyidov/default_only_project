import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/colors.dart';

class ButtonNc extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  final double width;

  const ButtonNc({
    Key? key,
    required this.text,
    required this.onTap,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _ButtonNcState createState() => _ButtonNcState();
}

class _ButtonNcState extends State<ButtonNc> {
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
          border: Border.all(color: AppColors.C_5200FF),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              color: AppColors.C_5200FF,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
