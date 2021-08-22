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
    required this.userId,
    required this.id,
    required this.title,
    required this.imageUri,
    required this.department,
    required this.year,
    required this.personCount,
    required this.adress,
    required this.phone,
    required this.about,
    required this.websites,
  });

  int userId;
  int id;
  String title;
  String imageUri;
  String department;
  String year;
  String personCount;
  String adress;
  String phone;
  String about;
  String websites;

  factory CompanyElement.fromJson(Map<String, dynamic> json) => CompanyElement(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        imageUri: json["imageUri"],
        department: json["department"],
        year: json["year"],
        personCount: json["personCount"],
        adress: json["adress"],
        phone: json["phone"],
        about: json["about"],
        websites: json["websites"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "imageUri": imageUri,
        "department": department,
        "year": year,
        "personCount": personCount,
        "adress": adress,
        "phone": phone,
        "about": about,
        "websites": websites,
      };
}
