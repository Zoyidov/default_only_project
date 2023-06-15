import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/home_screen.dart';
import 'dart:math';

import '../../utils/colors.dart';
import '../home/buttons_widget/circle.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 3 ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const StartScreen();
          },
        ),
      );
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.C_120084,
              AppColors.C_030651,
              AppColors.C_030651,
              AppColors.C_030651,
              AppColors.C_120084,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            for (int i = 0; i < 50; i++)
              Positioned(
                top: Random().nextDouble() * 900,
                left: Random().nextDouble() * 500,
                right: Random().nextDouble() * 500,
                child: Circle(
                  height: Random().nextDouble() * 100,
                  width: Random().nextDouble() * 100,
                  color: Colors.transparent,
                  shadowColor: AppColors.C_3F51B5,
                ),
              ),
            for (int i = 0; i < 50; i++)
              Positioned(
                top: Random().nextDouble() * 900,
                left: Random().nextDouble() * 500,
                right: Random().nextDouble() * 500,
                child: Circle(
                  height: Random().nextDouble() * 50,
                  width: Random().nextDouble() * 50,
                  color: Colors.transparent,
                  shadowColor: AppColors.C_448AFF,
                ),
              ),
            const Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(thickness: 1,color: AppColors.white,),
                  Text("𝓦𝓮𝓵𝓬𝓸𝓶𝓮 𝓽𝓸 𝓠𝓾𝓲𝔃",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900,color: AppColors.white),),
                  Divider(thickness: 1,color: AppColors.white,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
