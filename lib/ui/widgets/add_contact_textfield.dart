import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ContactTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String caption;
  final String? icon;
  final TextEditingController? controller;
  List<TextInputFormatter>? inputFormatters;

  ContactTextField({super.key,

    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    required this.caption, errorText,
    required this.controller,
    this.inputFormatters, this.icon
  }) ;

  @override
  State<ContactTextField> createState() => _ContactTextFieldState();
}

class _ContactTextFieldState extends State<ContactTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.caption.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              widget.caption,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        const SizedBox(height: 5,),
        TextField(
          inputFormatters: widget.inputFormatters,
          controller: widget.controller,
          focusNode: FocusNode(),
          decoration: InputDecoration(
            prefixIcon: (widget.icon!=null)? Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: Text(widget.icon!)):null,
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: const Color(0xFFFAFAFA),
          ),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
        ),
      ],
    );
  }
}