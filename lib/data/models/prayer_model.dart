class PrayerModel{

  final String region;
  final String date;
  final String weekday;
  final Map<String, String> times;

  PrayerModel({
    required this.region,
    required this.date,
    required this.weekday,
    required this.times
});

  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    return PrayerModel(
      region: json['region']?? "",
      date: json['date']?? "",
      weekday: json['weekday']?? "",
      times: Map<String, String>.from(json['times']),
    );
  }
}