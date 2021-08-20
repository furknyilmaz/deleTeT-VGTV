import 'package:deletedvgtv/models/login_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  login(LoginRequestModal requestModal, localUrl) async {
    var url = Uri.parse(localUrl);
    final response = await http.post(url, body: requestModal.toJson());
    print(response.body);
    return response;
    // return LoginResponseModal.fromJson(json.decode(response.body));
  }

  register(RegisterRequestModal requestModal, localUrl) async {
    var url = Uri.parse(localUrl);
    final response = await http.post(url, body: requestModal.toJson());
    print(response.statusCode);
    return response;
    // return LoginResponseModal.fromJson(json.decode(response.body));
  }
}
