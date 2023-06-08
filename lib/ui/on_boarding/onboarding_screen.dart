import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screen_homework/ui/widgets/global_box.dart';
import 'package:login_screen_homework/ui/widgets/global_button.dart';
import 'package:login_screen_homework/utils/colors.dart';
import 'package:login_screen_homework/utils/images.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.top,
        leading: Padding(
          padding: EdgeInsets.only(left: width * (18 / 375)),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text(
          "SEARCH RESULT",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            fontFamily: "Quicksand",
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * (18 / 375)),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.control),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.top,
              AppColors.between,
              AppColors.bottom,
              AppColors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: height * (60 / 812),
              width: width * (335 / 375),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * (1 / 375)),
                    child: const Text(
                      ' 22 AUG\n  \$1070',
                      style: TextStyle(
                          color: AppColors.purple,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(width: width * (20 / 375)),
                  const Text('23 AUG\n \$1114'),
                  SizedBox(width: width * (20 / 375)),
                  const Text('24 AUG\n \$1114'),
                  SizedBox(width: width * (20 / 375)),
                  const Text('25 AUG\n \$1122'),
                  SizedBox(width: width * (13 / 375)),
                  Container(
                    padding: const EdgeInsets.all(11),
                    height: height * (60 / 812),
                    width: width * (48 / 375),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                      color: AppColors.orange,
                    ),
                    child: SvgPicture.asset(AppImages.calendar),
                  ),
                ],
              ),
            ),
            Container(
              height: height * (2 / 812),
              width: width * (335 / 375),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.top,
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    children: const [
                      GlobalStack(
                        image: AppImages.turkish,
                        text: "Turkish Airlines",
                        price: '\$1070',
                        clock: '09:45',
                        clok: '19:00',
                        airtime: '17hrs 15mins',
                        stops: '1 Stop',
                      ),
                      GlobalStack(
                        image: AppImages.ethiopian,
                        text: "Ethiopian Airlines",
                        price: '\$1140',
                        clock: '11:00',
                        clok: '20:00',
                        airtime: '17hrs 15mins',
                        stops: '1 Stop',
                      ),
                      GlobalStack(
                        image: AppImages.etihad,
                        text: " Etihad Airways",
                        price: '\$1210',
                        clock: '09:45',
                        clok: '19:00',
                        airtime: '17hrs 15mins',
                        stops: '1 Stop',
                      ),
                      GlobalStack(
                        image: AppImages.emirates,
                        text: " Emirates",
                        price: '\$1430',
                        clock: '11:20',
                        clok: '07:20',
                        airtime: '12hrs 30mins',
                        stops: 'Non Stop',
                      ),
                      GlobalStack(
                        image: AppImages.american,
                        text: "American Airlines",
                        price: '\$1020',
                        clock: '10:45',
                        clok: '23:00',
                        airtime: '23hrs 15mins',
                        stops: '5 Stop',
                      ),
                      GlobalStack(
                        image: AppImages.uzb,
                        text: "Uzbekistan Airlines",
                        price: '\$11440',
                        clock: '04:00',
                        clok: '00:10',
                        airtime: '12hrs 10mins',
                        stops: '10 Stop',
                      ),
                      GlobalStack(
                        image: AppImages.kazak,
                        text: " Kazakhstan Airways",
                        price: '\$1430',
                        clock: '19:45',
                        clok: '09:00',
                        airtime: '14hrs 35mins',
                        stops: '3 Stop',
                      ),
                      GlobalStack(
                        image: AppImages.franc,
                        text: " Franc Airways",
                        price: '\$1340',
                        clock: '13:20',
                        clok: '17:20',
                        airtime: '4hrs',
                        stops: '4 Stop',
                      ),
                    ],
                  ),
                  Positioned(
                    top: 577,
                    child: Container(
                      width: 375,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [AppColors.white,],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.white.withOpacity(0.8),
                            spreadRadius: 20,
                            blurRadius: 20,
                            offset: const Offset(0, 20),
                          ),
                        ],
                      ),
                    ),
                  ),

                  GlobalElevatedButton(
                      text: "Filter",
                      svgIcon: AppImages.filter,
                      onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
