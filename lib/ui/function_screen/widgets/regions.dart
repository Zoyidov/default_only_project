import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/colors.dart';

class Regions extends StatefulWidget {
  final String prefixImage;
  final String text;
  final String selectedImage;
  final String notselectedImage;

  const Regions({
    required this.prefixImage,
    required this.text,
    required this.selectedImage,
    required this.notselectedImage,
  });

  @override
  _RegionsState createState() => _RegionsState();
}

class _RegionsState extends State<Regions> {
  bool _isNotSelectedImage = false;

  void _Image() {
    setState(() {
      _isNotSelectedImage = !_isNotSelectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    String suffixImage = _isNotSelectedImage
        ? widget.notselectedImage
        : widget.selectedImage;

    return GestureDetector(
      onTap: _Image,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                widget.prefixImage,
                width: 56,
                height: 40,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(
                suffixImage,
                width: 24,
                height: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
