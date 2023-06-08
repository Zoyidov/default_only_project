import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/on_boarding/onboarding_screen.dart';

void main() {
  runApp(const Airplane());
}

class Airplane extends StatelessWidget {
  const Airplane({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}
