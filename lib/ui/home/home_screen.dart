import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLanguage = "en";
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 500,
              color: Colors.black,
              child: Center(
                child: Text(
                  tr("hi_welcome_to_exam"),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 500,
              color: Colors.black,
              child: Center(
                child: Text(
                  tr("you_should_try_hard"),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 500,
              color: Colors.black,
              child: Center(
                child: Text(
                  tr("are_you_prepared"),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.white,
                    child: ZoomTapAnimation(
                      child: GestureDetector(
                        onTap: () {
                          context.setLocale(
                            const Locale("uz"),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          child: const Icon(
                            Icons.language,
                            color: Colors.black,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.white,
                    child: ZoomTapAnimation(
                      child: GestureDetector(
                        onTap: () {
                          context.setLocale(
                            const Locale("en"),
                          );
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          child: const Icon(
                            Icons.language,
                            color: Colors.black,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.cyan,
    );
  }
}
