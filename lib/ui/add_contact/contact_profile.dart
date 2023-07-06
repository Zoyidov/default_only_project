import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ContactProfile extends StatelessWidget {
  const ContactProfile(
      {Key? key,
      required this.image,
      required this.onTap,
      required this.selected})
      : super(key: key);

  final String image;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onLongTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('No information found!'),
              content: ZoomTapAnimation(
                onTap: (){Navigator.pop(context);},
                  child: Icon(CupertinoIcons.refresh_bold,color: Colors.red),)
            );
          },
        );
      },
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                image,
              ),
            ),
            if (selected)
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.grey.withOpacity(0.9)),
                child: Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.black,
                )),
              )
          ],
        ),
      ),
    );
  }
}
