import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToastWidget extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final Duration duration;

  ToastWidget({
    required this.message,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.duration = const Duration(seconds: 1),
  });

  @override
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> {
  @override
  void initState() {
    super.initState();
    _showToast();
  }

  void _showToast() async {
    await Future.delayed(widget.duration);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            widget.message,
            style: TextStyle(color: widget.textColor),
          ),
        ),
      ),
    );
  }
}

void showToast(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ToastWidget(message: message);
    },
  );
}