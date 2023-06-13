import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/about_screen.dart';
import 'package:login_screen_homework/utils/colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key});

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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return About();
                        }),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 36,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 40,
                              width: 327,
                              child: Text(
                                "About Us?",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text("Study is a  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum. "),
                        SizedBox(height: 24,),
                        Divider(thickness: 1,color: AppColors.C_F1F5F9,),
                        SizedBox(
                          height: 36,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              height: 40,
                              width: 327,
                              child: Text(
                                "Lorem Ipsum",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text("""•  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum.\n\n\n•  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum.\n\n\n•  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tellus ut sagittis libero augue interdum. """),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
