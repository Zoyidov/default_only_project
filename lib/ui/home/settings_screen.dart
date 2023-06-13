import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/function_screen/app_language.dart';
import 'package:login_screen_homework/ui/home/home_screen.dart';
import 'package:login_screen_homework/utils/colors.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key});

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
                    "Settings",
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
                                    return Language();
                                  }));
                            },
                            child: SizedBox(
                              height: 40,
                              width: 327,
                              child: Text(
                                "App language",
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
                            child: GestureDetector(
                              onTap: (){},
                              child: SizedBox(
                                height: 40,
                                width: 327,
                                child: Text(
                                  "Notification",
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
                        child: Text(
                          "Update version",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
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
