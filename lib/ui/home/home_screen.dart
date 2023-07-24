import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/widgets/change_color.dart';
import 'package:login_screen_homework/ui/home/widgets/change_location.dart';
import 'package:login_screen_homework/ui/home/widgets/change_shape.dart';
import 'package:login_screen_homework/ui/home/widgets/appereance.dart';
import 'package:login_screen_homework/ui/home/widgets/animation_container.dart';
import 'package:login_screen_homework/ui/home/widgets/container_size.dart';
import 'package:login_screen_homework/ui/home/widgets/flexible_container.dart';
import 'package:login_screen_homework/ui/home/widgets/animated_text.dart';
import 'package:login_screen_homework/ui/home/widgets/s.dart';
import 'package:login_screen_homework/ui/home/widgets/text_font_change.dart';
import 'package:login_screen_homework/ui/home/widgets/turn_right.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Home',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.white,
              title: const Text('Change color',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ChangeColorScreen();
                }));
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Change location',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ChangeLocationScreen();
                }));
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Change shape',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ChangeShapeScreen();
                }));
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Turn to Right',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TurnToRight();
                }));
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('TextFontChange',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TextFontChange();
                }));
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Appereance',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Appereance();
                }));
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Flexible Container',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FlexibleContainer();
                }));
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Animation Conatiner',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Animation_Container();
                }));
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Container Size',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ContainerSize();
                }));
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Animated Text',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Animated_Text();
                }));
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Animated',style: TextStyle(color: Colors.black),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AnimationEighthScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
