import 'package:deletedvgtv/models/login_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  login(LoginRequestModal requestModal) async {
    var url = Uri.parse('https://dgsbilgim.com/api/login');
    final response = await http.post(url, body: requestModal.toJson());
    return response;
    // return LoginResponseModal.fromJson(json.decode(response.body));
  }
}
