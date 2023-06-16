import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/widgets/button.dart';
import 'package:login_screen_homework/ui/widgets/global_textfield.dart';
import 'package:login_screen_homework/utils/colors.dart';
import 'package:login_screen_homework/utils/images.dart';

import '../login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;

  void toggleRememberMe(bool newValue) {
    setState(() {
      rememberMe = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 22,),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppImages.sign,
                height: 186,
                width: 226,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontFamily: "SfPro",
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 16,),
            GlobalTextField(
              text: "First Name",
              type: TextInputType.name,
              action: TextInputAction.next,
              icon: const Icon(
                Icons.perm_identity_outlined,
                color: AppColors.C_1317DD,
              ),
              textColor: AppColors.blackColor,
              onChanged: (v) {},
            ),
            const SizedBox(
              height: 6,
            ),
            GlobalTextField(
              text: "Last Name",
              type: TextInputType.name,
              action: TextInputAction.next,
              icon: const Icon(
                Icons.perm_identity_outlined,
                color: AppColors.C_1317DD,
              ),
              textColor: AppColors.blackColor,
              onChanged: (v) {},
            ),
            const SizedBox(
              height: 6,
            ),
            GlobalTextField(
              text: "Email",
              type: TextInputType.name,
              action: TextInputAction.next,
              icon: const Icon(
                Icons.email_outlined,
                color: AppColors.C_1317DD,
              ),
              textColor: AppColors.blackColor,
              onChanged: (v) {},
            ),
            const SizedBox(
              height: 6,
            ),
            GlobalTextField(
              text: "Password",
              type: TextInputType.visiblePassword,
              action: TextInputAction.done,
              icon: const Icon(
                Icons.lock_outline,
                color: AppColors.C_1317DD,
              ),
              textColor: AppColors.blackColor,
              onChanged: (v) {},
            ),
            const SizedBox(
              height: 6,
            ),
            GlobalTextField(
              text: "Confirm Password",
              type: TextInputType.visiblePassword,
              action: TextInputAction.done,
              icon: const Icon(
                Icons.lock_outline,
                color: AppColors.C_1317DD,
              ),
              textColor: AppColors.blackColor,
              onChanged: (v) {},
            ),
            const SizedBox(height: 62),
            Button(text: "SIGNUP", onPressed: (){}),
            const SizedBox(height: 60,),
            RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: const TextStyle(
                  fontFamily: "SfPro",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.blackColor,
                ),
                children: [
                  TextSpan(
                    text: "Login",
                    style: const TextStyle(
                      fontFamily: "SfPro",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.C_1317DD,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
