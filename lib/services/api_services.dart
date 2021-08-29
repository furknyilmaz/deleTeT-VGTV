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
    print(response.body);
    return response;
  }

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
    print(response.body);
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

Future<List<Newsfeed>> fetchNewfeed(http.Client client) async {
  final response = await client.get(Uri.parse(newsfeedAPI));
  print(response.body);
  return compute(parseNewFeed, utf8.decode(response.bodyBytes));
}

List<Newsfeed> parseNewFeed(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Newsfeed>((json) => Newsfeed.fromJson(json)).toList();
}

Future<List<Application>> fetchApplication(http.Client client) async {
  var sp = await SharedPreferences.getInstance();
  String? userID = sp.getString("user_id");
  var deneme = applicationAPI + userID.toString();
  final response = await client.get(Uri.parse(deneme));
  print(response.body);
  return compute(parseApplication, utf8.decode(response.bodyBytes));
}

List<Application> parseApplication(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Application>((json) => Application.fromJson(json)).toList();
}

//Mülakatlar Listesi API bağlantısı
Future<Interview> getInterview(url) async {
  var apiUrl = await http.get(Uri.parse(url));
  var response = json.decode(utf8.decode(apiUrl.bodyBytes));
  var data = Interview.fromJson(response);
  return data;
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
