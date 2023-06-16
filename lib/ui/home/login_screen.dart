import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_screen_homework/ui/home/widgets/sign_up.dart';
import 'package:login_screen_homework/ui/widgets/button.dart';
import 'package:login_screen_homework/ui/widgets/global_textfield.dart';
import 'package:login_screen_homework/ui/widgets/socials.dart';
import 'package:login_screen_homework/utils/colors.dart';
import 'package:login_screen_homework/utils/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                AppImages.login,
                height: 225,
                width: 218,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontFamily: "SfPro",
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GlobalTextField(
              text: "Email",
              type: TextInputType.emailAddress,
              action: TextInputAction.next,
              icon: SvgPicture.asset(AppImages.email),
              textColor: AppColors.blackColor,
              onChanged: (String value) {},
            ),
            const SizedBox(
              height: 6,
            ),
            GlobalTextField(
              text: "Password",
              type: TextInputType.visiblePassword,
              action: TextInputAction.done,
              icon: SvgPicture.asset(AppImages.password),
              textColor: AppColors.blackColor,
              onChanged: (String value) {},
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 48),
                Transform.scale(
                  scale: 0.6,
                  child: CupertinoSwitch(
                    value: rememberMe,
                    onChanged: toggleRememberMe,
                    activeColor: AppColors.C_1317DD,
                  ),
                ),
                const Text(
                  "Remember me",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "SfPro",
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(
                  width: 36,
                ),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "SfPro",
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Button(text: "LOGIN", onPressed: () {}),
            const SizedBox(
              height: 13,
            ),
            const Column(
              children: [
                Text(
                  "OR",
                  style: TextStyle(
                    fontFamily: "SfPro",
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Log in with",
                  style: TextStyle(
                    fontFamily: "SfPro",
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  svgPicture: SvgPicture.asset(AppImages.google),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 37,
                ),
                SocialButton(
                  svgPicture: SvgPicture.asset(AppImages.apple),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 37,
                ),
                SocialButton(
                  svgPicture: SvgPicture.asset(AppImages.facebook),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(
                text: "Don’t have an account? ",
                style: TextStyle(
                  fontFamily: "SfPro",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.blackColor,
                ),
                children: [
                  TextSpan(
                    text: "Register now",
                    style: TextStyle(
                      fontFamily: "SfPro",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.C_1317DD,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
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
