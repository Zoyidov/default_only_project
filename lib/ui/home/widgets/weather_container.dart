import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../show_modal_bottom_view/show_modal_bottom_view.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key? key, this.image}) : super(key: key);

  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF7730F6).withOpacity(0.83),
            Color(0xFF000000).withOpacity(0.0083),
          ],
        ),
      ),
      child: ZoomTapAnimation(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            clipBehavior: Clip.hardEdge,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) {
              return DailyWeatherScreen();
            },
          );
        },
        child: image != null
            ? Image(image: image!, fit: BoxFit.contain)
            : SizedBox(), // Placeholder widget if image is not provided
      ),
    );
  }
}
