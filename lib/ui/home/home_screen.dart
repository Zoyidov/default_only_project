import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var images = [
    "https:\/\/www.freetogame.com\/g\/540\/thumbnail.jpg",
    "https:\/\/www.freetogame.com\/g\/521\/thumbnail.jpg",
    "https:\/\/www.freetogame.com\/g\/517\/thumbnail.jpg",
    "https:\/\/www.freetogame.com\/g\/516\/thumbnail.jpg",
    "https:\/\/www.freetogame.com\/g\/508\/thumbnail.jpg",
  ];


  void callbackFunction(int index, CarouselPageChangedReason reason) {

    print("Page changed to index $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 270,
            width: 400,
            child: CarouselSlider(
              items: images.map((url) {
                return Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
