
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_screen_homework/ui/home/widgets/toast.dart';
import 'package:provider/provider.dart';

import '../../provider/calculator_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CalculatorProvider>(context, listen: false);

    TextEditingController number1 = TextEditingController();
    TextEditingController number2 = TextEditingController();

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
                                fontSize: 45,
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
                            controller: number1,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
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
                            controller: number2,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
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
                          number2.clear();
                          number1.clear();
                        },
                        style:
                        TextButton.styleFrom(backgroundColor: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Text(
                            "AC",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                            provider.middleArithmetic(
                                int.parse(number1.text), int.parse(number2.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.orange),
                        child: const Text(
                          "Ar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                            provider.mediumGeometric(
                                int.parse(number1.text), int.parse(number2.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.orange),
                        child: const Text(
                          "Ge",
                          style: TextStyle(color: Colors.white),
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
                          if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                            provider.add(int.parse(number1.text), int.parse(number2.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.orange),
                        child: Icon(Icons.add, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                            provider.subtraction(
                                int.parse(number1.text), int.parse(number2.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.orange),
                        child: Icon(CupertinoIcons.minus, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                            provider.multiplication(
                                int.parse(number1.text), int.parse(number2.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.orange),
                        child: Icon(CupertinoIcons.multiply, color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ClipOval(
                      child: TextButton(
                        onPressed: () {
                          if (number1.text.isNotEmpty && number2.text.isNotEmpty) {
                            provider.division(
                                int.parse(number1.text), int.parse(number2.text));
                          } else {
                            ToastWidget(message: 'Fill Fields');
                          }
                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.orange),
                        child: Icon(CupertinoIcons.divide, color: Colors.white, size: 30),
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