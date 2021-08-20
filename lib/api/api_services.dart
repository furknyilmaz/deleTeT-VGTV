import 'package:deletedvgtv/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIServices {
  Future<LoginResponseModal> login(LoginRequestModal requestModal) async {
    var url = Uri.parse('https://dgsbilgim.com/api/login');

    final response = await http.post(url, body: requestModal.toJson());

    var data = json.decode(response.body.toString());

    LoginResponseModal mesajlar = LoginResponseModal.fromJson(data);
    return LoginResponseModal.fromJson(json.decode(response.body));
  }
}
