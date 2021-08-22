import 'dart:convert';

Interview interviewFromJson(String str) => Interview.fromJson(json.decode(str));

String interviewToJson(Interview data) => json.encode(data.toJson());

class Interview {
  Interview({required this.interview});

  List<InterviewElement> interview;

  factory Interview.fromJson(Map<String, dynamic> json) => Interview(
        interview: List<InterviewElement>.from(
            json["interview"].map((x) => InterviewElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "interview": List<dynamic>.from(interview.map((x) => x.toJson())),
      };
}

class InterviewElement {
  InterviewElement({
    required this.id,
    required this.companyName,
    required this.companyDate,
    required this.companyImage,
    required this.companyDescription,
    required this.companyOfficel,
    required this.department,
    required this.iChalengeStatu,
    required this.iToken,
    required this.iChallengeName,
    required this.applicationName,
    required this.applicationDesc,
  });

  int id;
  String companyName;
  String companyDate;
  String companyImage;
  String companyDescription;
  String companyOfficel;
  String department;
  bool iChalengeStatu;
  String iToken;
  String iChallengeName;
  String applicationName;
  String applicationDesc;

  factory InterviewElement.fromJson(Map<String, dynamic> json) =>
      InterviewElement(
        id: json["id"],
        companyName: json["companyName"],
        companyDate: json["companyDate"],
        companyImage: json["companyImage"],
        companyDescription: json["companyDescription"],
        companyOfficel: json["companyOfficel"],
        department: json["department"],
        iChalengeStatu: json["iChalengeStatu"],
        iToken: json["iToken"],
        iChallengeName: json["iChallengeName"],
        applicationName: json["applicationName"],
        applicationDesc: json["applicationDesc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyName": companyName,
        "companyDate": companyDate,
        "companyImage": companyImage,
        "companyDescription": companyDescription,
        "companyOfficel": companyOfficel,
        "department": department,
        "iChalengeStatu": iChalengeStatu,
        "iToken": iToken,
        "iChallengeName": iChallengeName,
        "applicationName": applicationName,
        "applicationDesc": applicationDesc,
      };
}
