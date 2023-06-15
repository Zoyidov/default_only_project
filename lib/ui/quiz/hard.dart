import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/level_screen.dart';
import 'package:login_screen_homework/utils/colors.dart';

import '../home/buttons_widget/circle.dart';


class HardLevel extends StatefulWidget {
  const HardLevel({Key? key}) : super(key: key);


  @override
  _HardLevelState createState() => _HardLevelState();
}

class _HardLevelState extends State<HardLevel> {
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
            Column(
              children: [
                Column(
                  children: [

                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height * (50 / 812)),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 50,
                    width: 150,
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Hard",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: AppColors.white),
                        )),
                  )),
            ),
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
                      return const LevelScreen();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
