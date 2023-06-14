import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/widgets/c_button.dart';
import 'package:login_screen_homework/ui/home/widgets/circle.dart';
import 'package:login_screen_homework/ui/home/widgets/level_button.dart';
import 'package:login_screen_homework/utils/colors.dart';

import 'data_about/data_quiz_screen.dart';
import 'home_screen.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({Key? key}) : super(key: key);

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
            ListView(children: [
              Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * (120 / 812)),
                        child: const Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "EasY",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                  color: AppColors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Level(
                          text: "Start Quiz",
                          onTap: () {},
                          height: 43,
                          width: 190),
                      Padding(
                        padding: EdgeInsets.only(top: height * (120 / 812)),
                        child: const Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "NorMal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                  color: AppColors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Level(
                          text: "Start Quiz",
                          onTap: () {},
                          height: 43,
                          width: 190),
                      Padding(
                        padding: EdgeInsets.only(top: height * (120 / 812)),
                        child: const Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "HaRd",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                  color: AppColors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Level(
                          text: "Start Quiz",
                          onTap: () {},
                          height: 43,
                          width: 190),
                      const SizedBox(
                        height: 80,
                      ),
                      ButtonC(
                          text: "About",
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const About_Quiz();
                              }),
                            );
                          },
                          height: 50,
                          width: 150)
                    ],
                  ),
                ],
              ),
            ]),
            Positioned(
              top: height * (55 / 812),
              left: width * (10 / 375),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const StartScreen();
                    }),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * (50 / 812)),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        color: AppColors.C_5200FF),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "𝐋𝐞𝐯𝐞𝐥 𝐔𝐩",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.white),
                        )),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
