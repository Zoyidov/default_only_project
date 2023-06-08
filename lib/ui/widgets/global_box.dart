import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class GlobalStack extends StatelessWidget {
  final String image;
  final String text;
  final String price;
  final String clock;
  final String clok;
  final String airtime;
  final String stops;

  const GlobalStack({
    Key? key,
    required this.image,
    required this.text,
    required this.price,
    required this.clock,
    required this.clok,
    required this.airtime,
    required this.stops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
          top: height * (12 / 812),
          left: width * (20 / 375),
          right: width * (20 / 375)),
      child: Container(
        width: double.infinity,
        height: height * (120 / 812),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * (4 / 812), horizontal: width * (10 / 375)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    image,
                    height: height * (18 / 812),
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 13,
                      letterSpacing: 1,
                      color: AppColors.deepBlack,
                      fontFamily: "Quicksand",
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * (6 / 812)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "NYC\n",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        letterSpacing: 1,
                        color: AppColors.black,
                        fontFamily: "Quicksand",
                      ),
                      children: [
                        TextSpan(
                          text: clock,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            letterSpacing: 1,
                            color: AppColors.deepBlack,
                            fontFamily: "Quicksand",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        airtime,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 1,
                          color: AppColors.text,
                          fontFamily: "Quicksand",
                        ),
                      ),
                      SizedBox(height: height * (6 / 812)),
                      SvgPicture.asset(AppImages.airplane),
                      SizedBox(height: height * (6 / 812)),
                      Text(
                        stops,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: 1,
                          color: AppColors.text,
                          fontFamily: "Quicksand",
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "\nDXB",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          letterSpacing: 1,
                          color: AppColors.black,
                          fontFamily: "Quicksand",
                        ),
                      ),
                      Text(
                        clok,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          letterSpacing: 1,
                          color: AppColors.deepBlack,
                          fontFamily: "Quicksand",
                        ),
                      ),
                      const Text(
                        "+1days",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                          letterSpacing: 1,
                          color: AppColors.deepOrange,
                          fontFamily: "Quicksand",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.info),
                      SizedBox(width: width * (6 / 375)),
                      const Text(
                        "FLIGHT INFO",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          letterSpacing: 1,
                          color: AppColors.grey,
                          fontFamily: "Quicksand",
                        ),
                      ),
                    ],
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: AppColors.top,
                      fontFamily: "Quicksand",
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
