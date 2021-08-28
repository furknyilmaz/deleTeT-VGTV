import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/models/application_model.dart';
import 'package:deletedvgtv/models/company_model.dart';
import 'package:deletedvgtv/models/interview_model.dart';
import 'package:deletedvgtv/models/login_model.dart';
import 'package:deletedvgtv/models/newsfeed_modal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:flutter/foundation.dart';

class UserAPIServices {
  // Kullanıcı Giriş API bağlantısı
  login(LoginRequestModal requestModal, localUrl) async {
    var url = Uri.parse(localUrl);
    final response = await http.post(url, body: requestModal.toJson());
    print(response.body);
    return response;
  }

  // Kullanıcı Kayıt API bağlantısı
  register(RegisterRequestModal requestModal, localUrl) async {
    var url = Uri.parse(localUrl);
    final response = await http.post(url, body: requestModal.toJson());
    print(response.statusCode);
    return response;
  }
}

//Mülakatlar Listesi API bağlantısı
Future<Interview> getInterview(url) async {
  var apiUrl = await http.get(Uri.parse(url));
  var response = json.decode(utf8.decode(apiUrl.bodyBytes));
  var data = Interview.fromJson(response);
  print(data.toString());
  return data;
}

// Şirketler Listeis API bağlantısı
Future<List<Company>> fetchCompany(http.Client client) async {
  final response = await client.get(Uri.parse(companyAPI));
  return compute(parseCompany, utf8.decode(response.bodyBytes));
}

List<Company> parseCompany(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Company>((json) => Company.fromJson(json)).toList();
}

Future<Newsfeed> getFeedNews(url) async {
  var apiUrl = await http.get(Uri.parse(url));
  var response = json.decode(utf8.decode(apiUrl.bodyBytes));
  var data = Newsfeed.fromJson(response);
  return data;
}

Future<Application> getApplication(url) async {
  var apiUrl = await http.get(Uri.parse(url));
  var response = json.decode(utf8.decode(apiUrl.bodyBytes));
  var data = Application.fromJson(response);
  return data;
}

// Future<Advers> getAdvers(urlx) async {
// Başvurular eski API bağlantısı
//   var apiUrl = await http.get(Uri.parse(urlx));
//   var response = json.decode(utf8.decode(apiUrl.bodyBytes));
//   var data = Advers.fromJson(response);
//   return data;
// }

/// Başvurular API bağlantısı
Future<List<Advers>> fetchAdvers(http.Client client) async {
  final response = await client.get(Uri.parse(adversAPI));
  json.decode(utf8.decode(response.bodyBytes));
  return compute(parseAdvers, response.body);
}

List<Advers> parseAdvers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Advers>((json) => Advers.fromJson(json)).toList();
}
