import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/widgets/input_adress.dart';
import 'package:login_screen_homework/utils/colors.dart';

import 'home_screen.dart';

class Account extends StatelessWidget {
  const Account({super.key});

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
                      )),
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView(children: [
                  Column(
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Old Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                        ),
                      ),
                      UniversalInput(
                        type: TextInputType.text,
                        hintText: "Old Password",
                        action: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "New Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )),
                      UniversalInput(
                        type: TextInputType.emailAddress,
                        hintText: "New Password",
                        action: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Confirm Passwordh",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )),
                      UniversalInput(
                        type: TextInputType.datetime,
                        hintText: "Confirm Password",
                        action: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 56,
                          width: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.C_52B6DF),
                          child: Stack(
                            children: [
                              Align(
                                  child: Text(
                                    "Update Profil",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor),
                                  )),
                            ],
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
