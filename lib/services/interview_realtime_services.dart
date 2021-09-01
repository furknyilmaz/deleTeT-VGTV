import 'dart:convert';
import 'package:http/http.dart' as http;

class InverviewRealTime {
  static final double status = 100;

  static Stream<String> getInterview() => Stream.periodic(Duration(seconds: 2))
      .asyncMap((_) => getInterviewStatu());

  static Future<String> getInterviewStatu() async {
    if (1 == 1) {
      final url = 'http://89.252.131.149:8080/api/deletet/profile/108';
      final response = await http.get(Uri.parse(url));
      final body = json.decode(response.body).first;
      var statusx = body['profilePoints'].toString();
      print(statusx);
      return statusx;
    } else {
      return '100';
    }
  }
}
