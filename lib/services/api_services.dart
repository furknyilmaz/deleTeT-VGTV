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
Future<Interview> getInterview(urlx) async {
  var url = Uri.parse(urlx);
  var apiUrl = await http.get(url);
  var response = json.decode(utf8.decode(apiUrl.bodyBytes));
  var data = Interview.fromJson(response);
  print(data.toString());
  return data;
}

// Şirketler Listeis API bağlantısı
Future<Company> getCompany(urlx) async {
  var url = Uri.parse(urlx);
  var apiUrl = await http.get(url);
  var response = json.decode(utf8.decode(apiUrl.bodyBytes));
  var data = Company.fromJson(response);
  print(data.toString());
  return data;
}

Future<Newsfeed> getFeedNews(urlx) async {
  var url = Uri.parse(urlx);
  var apiUrl = await http.get(url);
  var response = json.decode(utf8.decode(apiUrl.bodyBytes));
  var data = Newsfeed.fromJson(response);
  print(data.toString());
  return data;
}
