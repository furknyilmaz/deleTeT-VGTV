// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({
    required this.company,
  });

  List<CompanyElement> company;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        company: List<CompanyElement>.from(
            json["company"].map((x) => CompanyElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "company": List<dynamic>.from(company.map((x) => x.toJson())),
      };
}

class CompanyElement {
  CompanyElement({
    required this.title,
    required this.imageUrl,
    required this.department,
    required this.year,
    required this.personCount,
    required this.adress,
    required this.phone,
    required this.about,
    required this.websites,
    required this.currentDate,
  });

  String title;
  String imageUrl;
  String department;
  String year;
  String personCount;
  String adress;
  String phone;
  String about;
  String websites;
  DateTime currentDate;

  factory CompanyElement.fromJson(Map<String, dynamic> json) => CompanyElement(
        title: json["title"],
        imageUrl: json["imageUrl"],
        department: json["department"],
        year: json["year"],
        personCount: json["personCount"],
        adress: json["adress"],
        phone: json["phone"],
        about: json["about"],
        websites: json["websites"],
        currentDate: DateTime.parse(json["currentDate"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "imageUrl": imageUrl,
        "department": department,
        "year": year,
        "personCount": personCount,
        "adress": adress,
        "phone": phone,
        "about": about,
        "websites": websites,
        "currentDate": currentDate.toIso8601String(),
      };
}
