import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/level_screen.dart';
import 'package:login_screen_homework/utils/colors.dart';

import 'buttons_widget/c_button.dart';
import 'buttons_widget/circle.dart';
import 'buttons_widget/nc_button.dart';
import 'data_about/data_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({
    super.key,
  });

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
                  shadowColor: Colors.indigo,
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
                  shadowColor: Colors.blueAccent,
                ),
              ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * (120 / 812)),
                    child: const Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "ℚ𝕦𝕚ℤ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 70,
                              color: AppColors.white),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * (150 / 812)),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "𝗟𝗲𝘁’𝘀 𝗣𝗹𝗮𝘆!",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 40,
                              color: AppColors.white),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * (10 / 812)),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "ᴾˡᵃʸ  ⁿᵒʷ & ᵂⁱⁿ",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 40,
                              color: AppColors.C_02FD2A1),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * (50 / 812)),
                    child: ButtonC(
                        text: "𝙿𝚕𝚊𝚢 𝙽𝚘𝚠",
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const LevelScreen();
                            }),
                          );
                        },
                        height: 55,
                        width: 256),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: height * (20 / 812)),
                      child: ButtonNc(
                          text: "About", onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const About();
                          }),
                        );
                      }, height: 55, width: 256))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
