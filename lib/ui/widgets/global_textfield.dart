import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_screen_homework/utils/colors.dart';

class GlobalTextField extends StatefulWidget {
  const GlobalTextField({
    Key? key,
    required this.text,
    required this.type,
    required this.action,
    required this.icon,
    required this.textColor,
    required this.onChanged,
  }) : super(key: key);

  final String text;
  final TextInputType type;
  final TextInputAction action;
  final SvgPicture icon;
  final Color textColor;
  final ValueChanged<String> onChanged;

  @override
  _GlobalTextFieldState createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    textController.addListener(() {});
    super.initState();
  }

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final bool isPasswordType = widget.type == TextInputType.visiblePassword;

    return Column(
      children: [
        Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.1),
                blurRadius: 6,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: TextField(
            onChanged: widget.onChanged,
            cursorColor: AppColors.blackColor.withOpacity(0.8),
            cursorHeight: 22,
            cursorWidth: 1,
            keyboardType: widget.type,
            textInputAction: widget.action,
            style: TextStyle(color: widget.textColor),
            obscureText: isPasswordType && !isPasswordVisible,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 12,left: 12,right: 8,bottom: 13),
                child: widget.icon,
              ),
              suffixIcon: isPasswordType
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      child: Icon(
                        isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: widget.textColor.withOpacity(0.8),
                      ),
                    )
                  : null,
              hintText: widget.text,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              hintStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
