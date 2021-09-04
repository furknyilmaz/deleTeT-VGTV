// To parse this JSON data, do
//
//     final applicationResponse = applicationResponseFromJson(jsonString);

import 'dart:convert';

List<ApplicationResponse> applicationResponseFromJson(String str) =>
    List<ApplicationResponse>.from(
        json.decode(str).map((x) => ApplicationResponse.fromJson(x)));

String applicationResponseToJson(List<ApplicationResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicationResponse {
  ApplicationResponse({
    required this.id,
    required this.applicantId,
    required this.companyId,
    required this.advertId,
    required this.companyName,
    required this.companyLocation,
    required this.companyIcon,
    required this.companyDesc,
    required this.applicationDate,
    required this.wayOfWorking,
    required this.advertsTitle,
    required this.advertsDescription,
    required this.advertsAbout,
    required this.status,
  });

  int id;
  int applicantId;
  int companyId;
  int advertId;
  String companyName;
  String companyLocation;
  String companyIcon;
  String companyDesc;
  String applicationDate;
  String wayOfWorking;
  String advertsTitle;
  String advertsDescription;
  String advertsAbout;
  int status;

  factory ApplicationResponse.fromJson(Map<String, dynamic> json) =>
      ApplicationResponse(
        id: json["id"],
        applicantId: json["applicantId"],
        companyId: json["companyId"],
        advertId: json["advertId"],
        companyName: json["companyName"],
        companyLocation: json["companyLocation"],
        companyIcon: json["companyIcon"],
        companyDesc: json["companyDesc"],
        applicationDate: json["applicationDate"],
        wayOfWorking: json["wayOfWorking"],
        advertsTitle: json["advertsTitle"],
        advertsDescription: json["advertsDescription"],
        advertsAbout: json["advertsAbout"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "applicantId": applicantId,
        "companyId": companyId,
        "advertId": advertId,
        "companyName": companyName,
        "companyLocation": companyLocation,
        "companyIcon": companyIcon,
        "companyDesc": companyDesc,
        "applicationDate": applicationDate,
        "wayOfWorking": wayOfWorking,
        "advertsTitle": advertsTitle,
        "advertsDescription": advertsDescription,
        "advertsAbout": advertsAbout,
        "status": status,
      };
}
