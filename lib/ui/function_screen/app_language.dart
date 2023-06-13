import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/function_screen/widgets/regions.dart';
import 'package:login_screen_homework/utils/colors.dart';
import 'package:login_screen_homework/utils/images.dart';

import '../home/settings_screen.dart';

class Language extends StatelessWidget {
  const Language({Key? key});

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
                          return Setting();
                        }),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    "Choose your language",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              TextField(
                textInputAction: TextInputAction.search,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.C_F1F5F9,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black12,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColors.C_F1F5F9,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.green,
                    ),
                  ),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [ Column(
                    children: [
                      SizedBox(
                        height: 32,
                      ),
                      Regions(prefixImage: AppImages.indonesia, text: "Indonesia", selectedImage: AppImages.notdone, notselectedImage: AppImages.Done,),
                      SizedBox(
                        height: 32,
                      ),
                      Regions(prefixImage: AppImages.philippine, text: "Philippines",selectedImage: AppImages.notdone, notselectedImage: AppImages.Done,),
                      SizedBox(
                        height: 32,
                      ),
                      Regions(prefixImage: AppImages.italy, text: "Italy",selectedImage: AppImages.notdone, notselectedImage: AppImages.Done,),
                      SizedBox(
                        height: 32,
                      ),
                      Regions(prefixImage: AppImages.irland, text: "Ireland",selectedImage: AppImages.notdone, notselectedImage: AppImages.Done,),
                      SizedBox(
                        height: 32,
                      ),
                      Regions(prefixImage: AppImages.german, text: "German",selectedImage: AppImages.notdone, notselectedImage: AppImages.Done,),
                      SizedBox(
                        height: 32,
                      ),
                      Regions(prefixImage: AppImages.malaysia, text: "Malaysia",selectedImage: AppImages.notdone, notselectedImage: AppImages.Done,),
                      SizedBox(
                        height: 32,
                      ),
                      Regions(prefixImage: AppImages.america, text: "America",selectedImage: AppImages.notdone, notselectedImage: AppImages.Done,),
                      SizedBox(
                        height: 32,
                      ),
                      Regions(prefixImage: AppImages.belgia, text: "Belgia",selectedImage: AppImages.notdone, notselectedImage: AppImages.Done,),
                      SizedBox(
                        height: 32,
                      ),
                      Regions(prefixImage: AppImages.zeland, text: "New Zeland",selectedImage: AppImages.notdone, notselectedImage: AppImages.Done,),
                    ],
                  ),
          ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
