import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));
String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({required this.company});
  List<CompanyElement> company;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        company: List<CompanyElement>.from(
            json["company"].map((res) => CompanyElement.fromJson(res))),
      );

  Map<String, dynamic> toJson() => {
        "company": List<dynamic>.from(company.map((res) => res.toJson())),
      };
}

class CompanyElement {
  CompanyElement({
    required this.userId,
    required this.id,
    required this.title,
    required this.imageUri,
  });

  int userId;
  int id;
  String title;
  String imageUri;

  factory CompanyElement.fromJson(Map<String, dynamic> json) => CompanyElement(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        imageUri: json["imageUri"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "imageUri": imageUri,
      };
}
