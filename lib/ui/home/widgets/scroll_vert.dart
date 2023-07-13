import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ScrollVertContainer extends StatelessWidget {
  final int index;

  ScrollVertContainer(this.index);

  List<String> icons = [
    'assets/images/burger.png',
    'assets/images/salad.png',
    'assets/images/pizza.png',
    'assets/images/snacdog.png',
    'assets/images/snack.png',
    'assets/images/sub.png',
    'assets/images/desert.png',
    'assets/images/burgerc.png',
  ];

  List<String> text = ['Чикен Бургер\n','Salad\n','Pizza\n','French Dog\n','Snack\n','Sub\n','Desert\n','Burger\n'];
  List<String> cost = ['\n\n₽160','\n\n₽260','\n\n₽330','\n\n₽360','\n\n₽710','\n\n₽320','\n\n₽280','\n\n₽130'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFF22222A),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 150,
              width: 150,
              child: Image.asset(
                icons[index],
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 120, right: 10),
              child: Container(
                width: 200,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: text[index], style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: 'Котлета куриная, свежие овощи, сыр чеддер, соус для бургера',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: cost[index], style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 10,
            child: ZoomTapAnimation(
              child: Icon(
                CupertinoIcons.add_circled_solid,
                size: 30,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
