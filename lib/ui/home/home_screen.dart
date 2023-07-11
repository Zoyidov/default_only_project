import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF180B37),
      body: Column(
        children: [
          Stack(children: [
            Image.asset(AppImages.back),
            Padding(
              padding: const EdgeInsets.only(top: 50,right: 20),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    CupertinoIcons.bell_fill,color: Colors.white,size: 30,)),
            )
          ],),
          Container(
            height: 51,
            width: 306,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(36),color: Colors.white),
            child: Center(child: Text("<     20 April 2023     >",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),)),
          ),
          SizedBox(height: 31,),
        ],
      ),
    );
  }
}
