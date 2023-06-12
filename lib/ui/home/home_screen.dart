import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_screen_homework/ui/home/home_screen2.dart';
import 'package:login_screen_homework/ui/home/widgets/box.dart';
import 'package:login_screen_homework/ui/home/widgets/settings.dart';
import 'package:login_screen_homework/utils/colors.dart';
import 'package:login_screen_homework/utils/images.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  int _selectedIndex = 0; // Variable to keep track of the selected tab index

  List<Widget> _pages = [
    Profile(),
    Profile(),
    Profile(),
    Profile(),
    // Define your page widgets here
    // Example: HomePage(), ProfilePage(), SettingsPage(), etc.
  ];
  final images = [
    AppImages.menu,
    AppImages.calendar,
    AppImages.message,
    AppImages.profile,
  ];
  final message = SvgPicture.asset(
    AppImages.message,
    // Use messageIconColor variable to set the color
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.ring),
                SizedBox(width: width * (8 / 375)),
                const Text(
                  "Study",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ],
            ),
            SizedBox(
                height: height * (30 / 812),
                width: width * (327 / 375),
                child: const Divider(
                  thickness: 1,
                  color: AppColors.C_F1F5F9,
                )),
            Row(
              children: [
                SizedBox(
                    height: 58, width: 58, child: Image.asset(AppImages.boy)),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.C_64748B),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Marvin Mckinney",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * (100 / 375)),
                  child: GestureDetector(
                      onTap: () {}, child: SvgPicture.asset(AppImages.exit)),
                ),
              ],
            ),
            SizedBox(
                height: height * (10 / 812),
                width: width * (327 / 375),
                child: const Divider(
                  thickness: 1,
                  color: AppColors.C_F1F5F9,
                )),
            Column(
              children: [
                SizedBox(
                  height: height * (40 / 812),
                ),
                Settings(
                  title: "Profile",
                  icon: AppImages.user,
                  widthIcon: 215,
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Profile();
                    }));
                  },
                ),
                SizedBox(
                  height: height * (25 / 812),
                ),
                Settings(
                  title: "Account",
                  icon: AppImages.account,
                  widthIcon: 215,
                  onTap: () {},
                ),
                SizedBox(
                  height: height * (25 / 812),
                ),
                Settings(
                  title: "Settings",
                  icon: AppImages.settings,
                  widthIcon: 215,
                  onTap: () {},
                ),
                SizedBox(
                  height: height * (25 / 812),
                ),
                Settings(
                  title: "About",
                  icon: AppImages.about,
                  widthIcon: 215,
                  onTap: () {},
                ),
                SizedBox(
                  height: height * (25 / 812),
                ),
              ],
            ),
            SizedBox(
              height: height * (20 / 812),
            ),
            Container(
              height: 85,
              width: 327,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.C_52B6DF),
              child: Stack(
                children: [
                  Positioned(
                    top: 14,
                    left: 25,
                    child: SvgPicture.asset(
                      AppImages.music,
                    ),
                  ),
                  Positioned(
                      top: height * (20 / 812),
                      left: width * (22 / 375),
                      child: const Ring(height: 7, width: 7)),
                  Positioned(
                      top: height * (13 / 812),
                      left: width * (92 / 375),
                      child: const Ring(height: 4, width: 4)),
                  Positioned(
                      top: height * (69 / 812),
                      left: width * (26 / 375),
                      child: const Ring(height: 3, width: 3)),
                  Positioned(
                      top: height * (73 / 812),
                      left: width * (78 / 375),
                      child: const Ring(height: 3, width: 3)),
                  Positioned(
                      top: height * (4 / 812),
                      left: width * (253 / 375),
                      child: SvgPicture.asset(AppImages.box1)),
                  Positioned(
                      left: width * (234 / 375),
                      child: SvgPicture.asset(AppImages.box2)),
                  Positioned(
                      left: width * (214 / 375),
                      child: SvgPicture.asset(AppImages.box3)),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * (31 / 812), left: width * (106 / 375)),
                    child: const Text(
                      "How can we help you?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: AppColors.whiteColor),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 63, left: 15),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF64748B),
                            fontSize: 13,
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        width: width * 8 / 375,
                      ),
                      SvgPicture.asset(AppImages.back)
                    ],
                  ),
                  SizedBox(
                    width: width * 48 / 375,
                  ),
                  Row(
                    children: [
                      Text(
                        'Terms',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF64748B),
                            fontSize: 13,
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        width: width * 8 / 375,
                      ),
                      SvgPicture.asset(AppImages.back)
                    ],
                  ),
                  SizedBox(
                    width: width * 48 / 375,
                  ),
                  Row(
                    children: [
                      Text(
                        'English',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF64748B),
                            fontSize: 13,
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        width: width * 8 / 375,
                      ),
                      SvgPicture.asset(AppImages.bBack)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 20 / 812,
            ),
            Spacer(),
            Container(
              height: 56.0, // Adjust the height as needed
              // color: Colors.grey, // Customize the background color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _buildNavigationItems(),
              ),
            )
          ],
        ),
      )),
    );
  }

  List<Widget> _buildNavigationItems() {
    return List.generate(_pages.length, (index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index; // Update the selected tab index
          });
        },
        child: Container(
          height: 40, width: 40,
          padding: EdgeInsets.all(8.0),
          // color: Colors.red,// Adjust the padding as needed
          child: _selectedIndex == index
              ? _selectedItemWidget(index)
              : _unselectedItemWidget(index),
        ),
      );
    });
  }

  Widget _selectedItemWidget(int index) {
    // Customize the selected item widget
    return SvgPicture.asset(
      images[index],
      color: AppColors.C_316D86,

    );
  }

  Widget _unselectedItemWidget(int index) {
    // Customize the unselected item widget
    return SvgPicture.asset(
      images[index], // Replace with the appropriate icon
      color: Colors.grey, // Customize the unselected icon color
    );
  }
}
