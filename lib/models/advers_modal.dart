import 'dart:convert';

Advers adversFromJson(String str) => Advers.fromJson(json.decode(str));
String adversToJson(Advers data) => json.encode(data.toJson());

class Advers {
  Advers({required this.advers});
  List<Adver> advers;

  factory Advers.fromJson(Map<String, dynamic> json) => Advers(
        advers: List<Adver>.from(json["advers"].map((x) => Adver.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "advers": List<dynamic>.from(advers.map((x) => x.toJson())),
      };
}

class Adver {
  Adver({
    required this.id,
    required this.userName,
    required this.companyName,
    required this.companyLocaliton,
    required this.companyIcon,
    required this.companyDesc,
    required this.adversDate,
    required this.wayOfWorking,
    required this.adversAbout,
    required this.adversTitle,
    required this.adversDescription,
  });
  int id;
  String userName;
  String companyName;
  String companyLocaliton;
  String companyIcon;
  String companyDesc;
  String adversDate;
  String wayOfWorking;
  String adversAbout;
  String adversTitle;
  String adversDescription;

  factory Adver.fromJson(Map<String, dynamic> json) => Adver(
        id: json['id'],
        userName: json["userName"],
        companyName: json["companyName"],
        companyLocaliton: json["companyLocaliton"],
        companyIcon: json["companyIcon"],
        companyDesc: json["companyDesc"],
        adversDate: json["adversDate"],
        wayOfWorking: json["wayOfWorking"],
        adversAbout: json["adversAbout"],
        adversTitle: json["adversTitle"],
        adversDescription: json["adversDescription"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "companyName": companyName,
        "companyLocaliton": companyLocaliton,
        "companyIcon": companyIcon,
        "companyDesc": companyDesc,
        "adversDate": adversDate,
        "wayOfWorking": wayOfWorking,
        "adversAbout": adversAbout,
        "adversTitle": adversTitle,
        "adversDescription": adversDescription,
      };
}
