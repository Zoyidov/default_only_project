import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/login_screen.dart';

void main(){
  runApp( const Start());
}
class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
