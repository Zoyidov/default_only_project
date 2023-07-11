import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/prayer_model.dart';


class PrayerScreen extends StatefulWidget {
  @override
  _PrayerScreenState createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  Future<PrayerModel?> getPrayerModel()async{
    Uri uri = Uri.parse("https://islomapi.uz/api/present/day?region=Toshkent");
    http.Response response = await http.get(uri);
    if(response.statusCode==200){
      print("ok");
      return PrayerModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PrayerModel?>(
        future: getPrayerModel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            print('ok7');
            final prayerModel = snapshot.data!;
            return Center(
              child: Text(prayerModel.region),
            );
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}
