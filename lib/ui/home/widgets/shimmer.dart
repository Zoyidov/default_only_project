import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/widgets/category.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.indigo.withOpacity(0.9),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 15,),
                  Categories(text: "",isSelected: false,),
                  Categories(text: "",isSelected: false,),
                  Categories(text: "",isSelected: false,),
                  Categories(text: "",isSelected: false,),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.indigo.withOpacity(0.9),
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.indigo,
    );
  }
}
