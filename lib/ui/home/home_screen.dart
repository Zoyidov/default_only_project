import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/widgets/change_color.dart';
import 'package:login_screen_homework/ui/home/widgets/change_location.dart';
import 'package:login_screen_homework/ui/home/widgets/change_shape.dart';
import 'package:login_screen_homework/ui/home/widgets/turn_right.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChangeColorScreen();
                  }));
                },
                child: Text('Change color')),
            SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChangeLocationScreen();
                  }));
                },
                child: Text('Change location')),
            SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChangeShapeScreen();
                  }));
                },
                child: Text('Change shape')),
            SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TurnToRight();
                  }));
                },
                child: Text('Turn to Right')),
          ],
        ),
      ),
    );
  }
}
