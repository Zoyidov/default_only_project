import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class UniversalInput extends StatefulWidget {
  const UniversalInput({
    Key? key,
    required this.type,
    required this.hintText,
    required this.action,
  }) : super(key: key);

  final TextInputType type;
  final String hintText;
  final TextInputAction action;

  @override
  _UniversalInputState createState() => _UniversalInputState();
}

class _UniversalInputState extends State<UniversalInput> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(padding: EdgeInsets.only(top: height * (8 / 812))),
        TextField(
          textInputAction: widget.action,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
          keyboardType: widget.type,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.C_F1F5F9,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black12,
            ),
            contentPadding:
            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: AppColors.C_CBD5E1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
