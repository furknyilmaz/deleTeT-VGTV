// To parse this JSON data, do
//
//     final application = applicationFromJson(jsonString);

import 'dart:convert';

Application applicationFromJson(String str) =>
    Application.fromJson(json.decode(str));

String applicationToJson(Application data) => json.encode(data.toJson());

class Application {
  Application({
    required this.application,
  });

  List<ApplicationElement> application;

  factory Application.fromJson(Map<String, dynamic> json) => Application(
        application: List<ApplicationElement>.from(
            json["application"].map((x) => ApplicationElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "application": List<dynamic>.from(application.map((x) => x.toJson())),
      };
}

class ApplicationElement {
  ApplicationElement({
    required this.id,
    required this.userId,
    required this.userName,
    required this.companyName,
    required this.companyIcon,
    required this.companyDesc,
    required this.adversTime,
    required this.adversTitle,
    required this.adversDescription,
    required this.status,
  });

  int id;
  int userId;
  String userName;
  String companyName;
  String companyIcon;
  String companyDesc;
  String adversTime;
  String adversTitle;
  String adversDescription;
  int status;

  factory ApplicationElement.fromJson(Map<String, dynamic> json) =>
      ApplicationElement(
        id: json["id"],
        userId: json["userID"],
        userName: json["userName"],
        companyName: json["companyName"],
        companyIcon: json["companyIcon"],
        companyDesc: json["companyDesc"],
        adversTime: json["adversTime"],
        adversTitle: json["adversTitle"],
        adversDescription: json["adversDescription"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userId,
        "userName": userName,
        "companyName": companyName,
        "companyIcon": companyIcon,
        "companyDesc": companyDesc,
        "adversTime": adversTime,
        "adversTitle": adversTitle,
        "adversDescription": adversDescription,
        "status": status,
      };
}
