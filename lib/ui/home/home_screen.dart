import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:login_screen_homework/data/models/prayer_model.dart';
import 'package:login_screen_homework/data/network/prayer_provider.dart';
import 'package:login_screen_homework/ui/home/widgets/calendar.dart';

import 'package:login_screen_homework/utils/images.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<String> data = ['Bomdod','Quyosh','Peshin','Asr','Shom','Xufton'];
  List<String> icons = ['assets/images/moon.png','assets/images/sun.png','assets/images/sun.png','assets/images/moon.png','assets/images/cloud.png','assets/images/moon.png'];


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPrayerData(),
      builder: (BuildContext context, AsyncSnapshot<PrayerModel?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: const Color(0xFF180B37),
            body: Center(
              child: CupertinoActivityIndicator(color: Colors.white,radius: 15,),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: const Color(0xFF180B37),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          PrayerModel? prayer = snapshot.data;
          List<String>? times= prayer?.times.values.toList();
          return Scaffold(
            backgroundColor: const Color(0xFF180B37),
            body: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(AppImages.back),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Text("Namoz Jadvali",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.white)),
                            TimerCountdown(

                              format: CountDownTimerFormat.hoursMinutesSeconds,
                              endTime: DateTime.now().add(
                                Duration(
                                  hours: 14,
                                  minutes: 27,
                                  seconds: 34,
                                ),
                              ),
                              onEnd: () {
                                print("Timer finished");
                              },
                            ),
                          ],
                        )
                      ),
                    ),
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
                Text("Mo'min bilan kofirning farqi namozni tark etishdir.",style: TextStyle(color: Colors.white)),
                SizedBox(height: 30),
                CalendarPage(),
                Expanded(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(prayer?.region ?? '',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text(prayer?.date ?? '',
                            style: TextStyle(color: Colors.white)),
                        trailing: Text(prayer?.weekday ?? '',
                            style: TextStyle(color: Colors.white)),
                      ),
                      if (prayer != null)
                        Expanded(
                          child: ListView.builder(itemBuilder: (context,index)=>Container(child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(icons[index],height: 20,width: 20,),
                                Text(data[index], style: TextStyle(color: Colors.white)),
                                Text(times![index], style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),),itemCount: prayer.times.length,)
        )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
  Future<PrayerModel?> getPrayerData() async {
    PrayerProvider apiProvider = PrayerProvider();
    return await apiProvider.getPrayerModel();
  }
}