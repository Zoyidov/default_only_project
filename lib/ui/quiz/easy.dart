import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_screen_homework/models/level_model.dart';
import 'package:login_screen_homework/ui/home/buttons_widget/level_button.dart';
import 'package:login_screen_homework/ui/home/level_screen.dart';
import 'package:login_screen_homework/utils/colors.dart';

import '../home/buttons_widget/c_button.dart';
import '../home/buttons_widget/circle.dart';

class EasyLevel extends StatefulWidget {
  const EasyLevel({Key? key, required this.levelModel}) : super(key: key);
  final LevelModel levelModel;

  @override
  _EasyLevelState createState() => _EasyLevelState();
}

class _EasyLevelState extends State<EasyLevel> {
  int cycle = 1;

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
                  children: [],
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
                      "Easy",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
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
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.white),
                    color: AppColors.C_030651.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, left: 14),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.white),
                    color: AppColors.C_030651.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 480, left: 14),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.white),
                    color: AppColors.C_030651.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 560, left: 14),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.white),
                    color: AppColors.C_030651.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 640, left: 14),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.white),
                    color: AppColors.C_030651.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            if (cycle > 1)
              Container(
                padding: const EdgeInsets.only(top: 700, left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Level(
                    text: "Previous",
                    onTap: () {
                      setState(() {
                        cycle = cycle - 1;
                      });
                    },
                    height: 50,
                    width: 100,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 700, right: 24),
              child: Align(
                alignment: Alignment.centerRight,
                child: ButtonC(
                  text: "Next",
                  onTap: () {
                    setState(() {
                      cycle = cycle + 1;
                    });
                  },
                  height: 50,
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
