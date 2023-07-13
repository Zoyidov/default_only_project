import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/images.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Scroll_Container extends StatefulWidget {
  final int index;

  Scroll_Container(this.index);

  @override
  _ScrollContainerState createState() => _ScrollContainerState();
}

class _ScrollContainerState extends State<Scroll_Container> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      AppImages.burger,
      AppImages.salad,
    ];

    return Container(
      height: 150,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF22222A),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 140,
                width: 140,
                child: Image.asset(
                  icons[widget.index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 130, top: 20),
              child: Container(
                width: 200,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Чикен Бургер\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                        'Котлета куриная, свежие овощи, сыр чеддер, соус для бургера',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      TextSpan(
                        text: '\n\n₽160',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 10,
            child: ZoomTapAnimation(
              child: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.white : Colors.red,
              ),
              onTap: toggleFavorite,
            ),
          ),
          Positioned(
            bottom: 15,
            right: 10,
            child: Icon(
              CupertinoIcons.lock_circle,
              size: 30,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
