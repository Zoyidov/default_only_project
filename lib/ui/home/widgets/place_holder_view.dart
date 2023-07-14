import 'package:flutter/material.dart';


class ChooseButtons extends StatefulWidget {
  const ChooseButtons({super.key});

  @override
  State<ChooseButtons> createState() => _ChooseButtonsState();
}

class _ChooseButtonsState extends State<ChooseButtons> {
  int selectedContainerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = selectedContainerIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedContainerIndex = -1;
                } else {
                  selectedContainerIndex = index;
                }
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 150,
              width: 100,
              color: isSelected ? Colors.blue : Colors.grey,
              child: Center(
                child: Text(
                  "${index + 1}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
