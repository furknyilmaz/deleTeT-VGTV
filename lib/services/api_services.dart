import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/models/application_model.dart';
import 'package:deletedvgtv/models/company_model.dart';
import 'package:deletedvgtv/models/interview_model.dart';
import 'package:deletedvgtv/models/login_model.dart';
import 'package:deletedvgtv/models/newsfeed_modal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
Future<Company> getCompany(url) async {
  var apiUrl = await http.get(Uri.parse(url));
  var response = json.decode(utf8.decode(apiUrl.bodyBytes));
  var data = Company.fromJson(response);
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

Future<Advers> getAdvers(urlx) async {
  var apiUrl = await http.get(Uri.parse(urlx));
  var response = json.decode(utf8.decode(apiUrl.bodyBytes));
  var data = Advers.fromJson(response);
  return data;
}
