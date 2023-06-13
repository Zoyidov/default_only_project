import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/home_screen.dart';
import 'package:login_screen_homework/ui/home/widgets/gender_button.dart';
import 'package:login_screen_homework/ui/home/widgets/input_adress.dart';
import 'package:login_screen_homework/utils/colors.dart';
import 'package:login_screen_homework/utils/images.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
                    "Profile",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 91,
                    child: Image.asset(AppImages.man),
                  ),
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
                            "Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          ),
                        ),
                      ),
                      UniversalInput(
                        type: TextInputType.text,
                        hintText: "Marvin McKinney",
                        action: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )),
                      UniversalInput(
                        type: TextInputType.emailAddress,
                        hintText: "marvin@email.com",
                        action: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Date of birth",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )),
                      UniversalInput(
                        type: TextInputType.datetime,
                        hintText: "11/08/1997",
                        action: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )),
                      UniversalInput(
                        type: TextInputType.number,
                        hintText: "702-889-5347",
                        action: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Student ID",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )),
                      UniversalInput(
                        type: TextInputType.phone,
                        hintText: "#87654",
                        action: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Gender",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )),
                      SizedBox(
                        height: 8,
                        width: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Gender(
                              icon: AppImages.notDone,
                              selectedIcon: AppImages.done,
                              text: "Male",
                              onTap: () {}),
                          Gender(
                            icon: AppImages.notDone,
                            selectedIcon: AppImages.done,
                            text: "Female", onTap: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Adress",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15),
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 100,
                        width: 327,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors.C_CBD5E1),
                            ),
                            filled: true,
                            fillColor: AppColors.C_F1F5F9,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          height: 56,
                          width: 327,
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