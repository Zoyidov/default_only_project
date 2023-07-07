import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/card_screen1.dart';
import 'package:login_screen_homework/ui/home/card_screen2.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardScreen1(),
    );
  }
}
