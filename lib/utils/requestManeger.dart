import 'dart:convert';
import 'package:deletedvgtv/models/profile_modal.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';

updateApplicationStatus(appID, status, value) async {
  if (status == 1) {
    var url = Uri.parse(statusChangeAPI + appID.toString());
    // ignore: unused_local_variable
    final response = await http.put(
      url,
      body: json.encode({"status": value}),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    print("Başvuru Statusu değiştirildi: " + value.toString());
  }
}

Future<Profile> fetchProfile(id) async {
  final response = await http.get(Uri.parse(profileAPI + id.toString()));
  if (response.statusCode == 200) {
    final jsonresponse = json.decode(utf8.decode(response.bodyBytes));
    return Profile.fromJson(jsonresponse[0]);
  } else {
    throw Exception(
        'Kullanıcı verilerilerine erişirken bir hata meydana geldi');
  }
}

Future<Profile> fetchProfileID() async {
  var sp = await SharedPreferences.getInstance();
  String? userID = sp.getString("user_id");
  if (userID != null) {}
  final response = await http.get(Uri.parse('${profileAPI + userID!}'));
  if (response.statusCode == 200) {
    final jsonresponse = json.decode(utf8.decode(response.bodyBytes));
    return Profile.fromJson(jsonresponse[0]);
  } else {
    throw Exception(
        'Kullanıcı verilerilerine erişirken bir hata meydana geldi');
  }
}
