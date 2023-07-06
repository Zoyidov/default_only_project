import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_screen_homework/ui/add_contact/add_contact_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return AddContact();
        }));
      },
      child: Container(
        height: 60.w,
        width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.w),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.99),
              spreadRadius: 2.w,
              blurRadius: 5.w,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

