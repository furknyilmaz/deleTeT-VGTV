import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/models/application_add_modal.dart';
import 'package:deletedvgtv/models/application_model.dart';
import 'package:deletedvgtv/models/company_model.dart';
import 'package:deletedvgtv/models/interview_model.dart';
import 'package:deletedvgtv/models/login_model.dart';
import 'package:deletedvgtv/models/newsfeed_modal.dart';
import 'package:deletedvgtv/models/profile_modal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAPIServices {
  // Kullanıcı Giriş API bağlantısı
  login(LoginRequestModal requestModal, localUrl) async {
    var url = Uri.parse(localUrl);
    final response = await http.post(
      url,
      body: json.encode(requestModal),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  // Kullanıcı Kayıt API bağlantısı
  register(RegisterRequestModal requestModal, localUrl) async {
    var url = Uri.parse(localUrl);

    print(requestModal.toJson());
    final response = await http.post(
      url,
      body: json.encode(requestModal),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  // Başvuru ekle API bağlantısı
  applicationAdd(ApplicationAddModal applicationModal, localUrl) async {
    print(applicationModal.toString());
    var url = Uri.parse(applicationAPI + 'create');
    final response = await http.post(
      url,
      body: json.encode(applicationModal),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}

// Şirketler Listeis API bağlantısı
Future<List<Company>> fetchCompany(http.Client client) async {
  await Future.delayed(Duration(milliseconds: 500));
  final response = await client.get(Uri.parse(companyAPI));
  return compute(parseCompany, utf8.decode(response.bodyBytes));
}

List<Company> parseCompany(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Company>((json) => Company.fromJson(json)).toList();
}

//Profile API bağlantısı
Future<List<Profile>> fetchCProfile(http.Client client) async {
  final response = await client.get(Uri.parse(profileAPI));
  return compute(parseProfile, utf8.decode(response.bodyBytes));
}

List<Profile> parseProfile(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Profile>((json) => Profile.fromJson(json)).toList();
}

/// İlanlar API bapantısı
Future<List<Advers>> fetchAdvers(http.Client client) async {
  final response = await client.get(Uri.parse(adversAPI));
  return compute(parseAdvers, utf8.decode(response.bodyBytes));
}

List<Advers> parseAdvers(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Advers>((json) => Advers.fromJson(json)).toList();
}

// Anasayfa Haberler API Bağlantısı
Future<List<Newsfeed>> fetchNewfeed(http.Client client) async {
  final response = await client.get(Uri.parse(newsfeedAPI));
  return compute(parseNewFeed, utf8.decode(response.bodyBytes));
}

List<Newsfeed> parseNewFeed(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Newsfeed>((json) => Newsfeed.fromJson(json)).toList();
}

// Mülakatlar Haberler API Bağlantısı
Future<List<Interview>> fetchInterview(http.Client client) async {
  var sp = await SharedPreferences.getInstance();
  var id = (sp.getString("user_id")!);
  final response = await client.get(Uri.parse(interviewAPI + id));
  print(response.body);

  return compute(parseInterview, utf8.decode(response.bodyBytes));
}

List<Interview> parseInterview(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Interview>((json) => Interview.fromJson(json)).toList();
}

// Başvurular API bağlantısı
Future<List<Application>> fetchApplication(http.Client client) async {
  var sp = await SharedPreferences.getInstance();
  String? id = sp.getString("user_id");
  var url = applicationAPI + id.toString();
  final response = await client.get(Uri.parse(url));
  return compute(parseApplication, utf8.decode(response.bodyBytes));
}

List<Application> parseApplication(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Application>((json) => Application.fromJson(json)).toList();
}

//
//
//
//
//
// İlanlar Firma API bağlantısı
Future<List<Advers>> fetchCompanyAdverts(http.Client client) async {
  var sp = await SharedPreferences.getInstance();
  String? id = sp.getString("user_id");
  var url = adversCompanyAPI + id.toString();
  print(id.toString());
  final response = await client.get(Uri.parse(url));
  return compute(parseCompanyAdverts, utf8.decode(response.bodyBytes));
}

List<Advers> parseCompanyAdverts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Advers>((json) => Advers.fromJson(json)).toList();
}

//
//
//
//
//

//
//
//
//
//
// Başvurular Firma API bağlantısı
Future<List<Application>> fetchCompanyApplication(http.Client client) async {
  var sp = await SharedPreferences.getInstance();
  String? id = sp.getString("user_id");
  var url = applicationCompanyAPI + id.toString();
  print(id.toString());
  final response = await client.get(Uri.parse(url));
  return compute(parseCompanyApplication, utf8.decode(response.bodyBytes));
}

List<Application> parseCompanyApplication(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Application>((json) => Application.fromJson(json)).toList();
}

//
//
//
//
//

// Mülakatlar Listesi API bağlantısı
Future<Interview> getInterview(url) async {
  var apiUrl = await http.get(Uri.parse(url));
  var response = json.decode(utf8.decode(apiUrl.bodyBytes));
  var data = Interview.fromJson(response);
  return data;
}

/////////////////////// Eski tip bağlantılar///////////////////////////////////
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
