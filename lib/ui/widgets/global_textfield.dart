import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final IconData prefixIcon;

  const SearchTextField({
    Key? key,
    required this.keyboardType,
    required this.textInputAction,
    required this.prefixIcon,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          cursorColor: Colors.white,
          cursorHeight: 25,
          style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.white54),
            suffixIcon: Icon(widget.prefixIcon,size: 30, color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1),
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
            fillColor: Colors.black,
          ),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
        ),
      ],
    );
  }
}
