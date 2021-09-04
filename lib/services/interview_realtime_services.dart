import 'dart:convert';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:http/http.dart' as http;

class InverviewRealTime {
  static final double status = 100;

  static Stream<String> getInterview(interId, applicantId) =>
      Stream.periodic(Duration(seconds: 6))
          .asyncMap((_) => getInterviewStatu(interId, applicantId));

  static Future<String> getInterviewStatu(interId, applicantId) async {
    var status;
    final url = interviewUserAPI + applicantId.toString();
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    for (var i = 0; i < body.length; i++) {
      if (body[i]['id'].toString() == interId.toString()) {
        status = body[i]['interStatus'].toString();
      }
    }
    return status;
  }
}
