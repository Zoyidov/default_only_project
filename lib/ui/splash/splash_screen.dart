import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screen_homework/ui/home/home_screen.dart';
import 'package:login_screen_homework/utils/colors.dart';

import '../../utils/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToWelcomeScreen(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 139,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 113),
              child: Image.asset(
                AppImages.book,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 112),
              child: Image.asset(AppImages.text),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Baca Al-Quran Degan Mudah",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey),
            ),
            SizedBox(height: 160,),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF9543FF)),
              ),
              child: Text(
                "Baca Sekarang",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.white),
              ),
            )

          ],
        ));
  }

  void _navigateToWelcomeScreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
    );
  }
}