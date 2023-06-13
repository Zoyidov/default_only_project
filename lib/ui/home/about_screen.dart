import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/home_screen.dart';
import 'package:login_screen_homework/utils/colors.dart';

import '../function_screen/about_us.dart';

class About extends StatelessWidget {
  const About({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    "About Us",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Expanded(
                child: ListView(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 36,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                                  return AboutUs();
                                }));
                          },
                          child: SizedBox(
                            height: 40,
                            width: 327,
                            child: Text(
                              "About Us",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.C_F1F5F9,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: SizedBox(
                            height: 40,
                            width: 327,
                            child: GestureDetector(
                              onTap: (){},
                              child: SizedBox(
                                height: 40,
                                width: 327,
                                child: Text(
                                  "Help",
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Divider(
                        thickness: 1,
                        color: AppColors.C_F1F5F9,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: (){},
                          child: SizedBox(
                            height: 40,
                            width: 327,
                            child: Text(
                              "Term and Condition",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.C_F1F5F9,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: (){},
                          child: SizedBox(
                            height: 40,
                            width: 327,
                            child: Text(
                              "Data Protection",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
