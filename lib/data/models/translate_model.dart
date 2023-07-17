import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  ResponseData responseData;
  dynamic quotaFinished;
  dynamic mtLangSupported;
  String responseDetails;
  String responseStatus;
  dynamic responderId;
  dynamic exceptionCode;
  String matches;

  Welcome({
    required this.responseData,
    this.quotaFinished,
    this.mtLangSupported,
    required this.responseDetails,
    required this.responseStatus,
    this.responderId,
    this.exceptionCode,
    required this.matches,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    responseData: ResponseData.fromJson(json["responseData"]),
    quotaFinished: json["quotaFinished"],
    mtLangSupported: json["mtLangSupported"],
    responseDetails: json["responseDetails"],
    responseStatus: json["responseStatus"],
    responderId: json["responderId"],
    exceptionCode: json["exception_code"],
    matches: json["matches"],
  );

  Map<String, dynamic> toJson() => {
    "responseData": responseData.toJson(),
    "quotaFinished": quotaFinished,
    "mtLangSupported": mtLangSupported,
    "responseDetails": responseDetails,
    "responseStatus": responseStatus,
    "responderId": responderId,
    "exception_code": exceptionCode,
    "matches": matches,
  };
}

class ResponseData {
  String translatedText;

  ResponseData({
    required this.translatedText,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    translatedText: json["translatedText"],
  );

  Map<String, dynamic> toJson() => {
    "translatedText": translatedText,
  };
}
