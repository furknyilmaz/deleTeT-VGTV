import 'dart:convert';
import 'dart:async';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Company>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse(companyAPI));
  return compute(parsePhotos, response.body);
}

List<Company> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Company>((json) => Company.fromJson(json)).toList();
}

class Company {
  final int id;
  final String title;
  final String imageUrl;
  final String department;
  final String year;
  final String personCount;
  final String adress;
  final String phone;
  final String about;
  final String websites;
  final DateTime currentDate;

  const Company({
    required this.id,
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

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json["id"] as int,
      title: json["title"] as String,
      imageUrl: json["imageUrl"] as String,
      department: json["department"] as String,
      year: json["year"] as String,
      personCount: json["personCount"] as String,
      adress: json["adress"] as String,
      phone: json["phone"] as String,
      about: json["about"] as String,
      websites: json["websites"] as String,
      currentDate: DateTime.parse(json["currentDate"]) as DateTime,
    );
  }
}
