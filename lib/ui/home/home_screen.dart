import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';

import 'package:intl/intl.dart';

import '../../data/models/prayer_model.dart';
import '../../data/network/prayer_provider.dart';
import '../../utils/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime selectedDate;
  PrayerModel? nomoz;
  PrayerProvider apiProvider = PrayerProvider();

  @override
  void initState() {
    selectedDate = DateTime.now();
    getPrayerData();
    super.initState();
  }

  Future<void> getPrayerData() async {
    setState(() {});
    nomoz = await apiProvider.getPrayerModel();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF180B37),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(AppImages.back),
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    CupertinoIcons.bell_fill,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          // CalendarWeek(
          //   todayBackgroundColor: Colors.white.withOpacity(0.3),
          //   backgroundColor: const Color(0xFF180B37),
          //   controller: CalendarWeekController(),
          //   height: 110,
          //   showMonth: true,
          //   minDate: DateTime.now().add(const Duration(days: -365)),
          //   maxDate: DateTime.now().add(const Duration(days: 365)),
          //   onDatePressed: (DateTime datetime) {},
          //   onDateLongPressed: (DateTime datetime) {},
          //   onWeekChanged: () {},
          //   monthViewBuilder: (DateTime time) => Align(
          //     alignment: FractionalOffset.center,
          //     child: Container(
          //       margin: const EdgeInsets.symmetric(vertical: 4),
          //       child: Text(
          //         DateFormat.yMMMM().format(time),
          //         overflow: TextOverflow.ellipsis,
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ),
          //   ),
          //   decorations: [
          //     DecorationItem(
          //       decorationAlignment: FractionalOffset.bottomRight,
          //       date: DateTime.now(),
          //       decoration: const Icon(
          //         Icons.today,
          //         color: Colors.white,
          //       ),
          //     ),
          //     DecorationItem(
          //       date: DateTime.now().add(const Duration(days: 3)),
          //       decoration: Text(
          //         'Holiday',
          //         style: const TextStyle(
          //           color: Colors.brown,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Column(
            children: [
              ListTile(
                title: Text(nomoz!.region),
                subtitle: Text(nomoz!.date),
                trailing: Text(nomoz!.weekday),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
