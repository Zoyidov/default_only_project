import 'package:default_project/ui/home/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/calc_provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CalculatorProvider>(context, listen: false);

    TextEditingController first_num = TextEditingController();
    TextEditingController second_num = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Consumer<CalculatorProvider>(
                          builder: (context, answer, child) {
                            return answer.getAnswer() != 0
                                ? Text(
                                    answer.getAnswer().toString(),
                                    style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                  )
                                : const SizedBox();
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              LengthLimitingTextInputFormatter(5),
                            ],
                            controller: first_num,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                focusColor: Colors.black),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              LengthLimitingTextInputFormatter(5),
                            ],
                            controller: second_num,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                focusColor: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 60,
                      child: TextButton(
                        onPressed: () {
                          second_num.clear();
                          first_num.clear();
                          provider.reset();
                        },
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "AC",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (first_num.text.isNotEmpty &&
                              second_num.text.isNotEmpty) {
                            provider.middleArithmetic(int.parse(first_num.text),
                                int.parse(second_num.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: const Text(
                          "Ar",
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (first_num.text.isNotEmpty &&
                              second_num.text.isNotEmpty) {
                            provider.mediumGeometric(int.parse(first_num.text),
                                int.parse(second_num.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: const Text(
                          "Ge",
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (first_num.text.isNotEmpty &&
                              second_num.text.isNotEmpty) {
                            provider.add(int.parse(first_num.text),
                                int.parse(second_num.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: Icon(Icons.add, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (first_num.text.isNotEmpty &&
                              second_num.text.isNotEmpty) {
                            provider.subtraction(int.parse(first_num.text),
                                int.parse(second_num.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: Icon(CupertinoIcons.minus,
                            color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (first_num.text.isNotEmpty &&
                              second_num.text.isNotEmpty) {
                            provider.multiplication(int.parse(first_num.text),
                                int.parse(second_num.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: Icon(CupertinoIcons.multiply,
                            color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (first_num.text.isNotEmpty &&
                              second_num.text.isNotEmpty) {
                            provider.division(int.parse(first_num.text),
                                int.parse(second_num.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.orange),
                        child: Icon(CupertinoIcons.divide,
                            color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
