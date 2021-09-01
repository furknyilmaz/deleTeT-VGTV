import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/models/login_model.dart';
import 'package:deletedvgtv/widgets/BottomMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

Future<void> userLogin(requestModal, context) async {
  UserAPIServices apiServices = new UserAPIServices();
  apiServices
      .login(
    requestModal,
    'http://89.252.131.149:8080/api/deletet/signin',
  )
      .then((response) async {
    print('ResponseCode: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      var data = LoginResponseModal.fromJson(json.decode(response.body));
      var sp = await SharedPreferences.getInstance();
      sp.setString("user_id", data.id.toString());
      sp.setString("user_email", data.email.toString());
      //sp.setString("name", data.firstName.toString());

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomMenu(),
        ),
      );
    } else {
      final snackBar = SnackBar(
        backgroundColor: Color(0xffE63946),
        content: Text(
            'Kullanıcı adı veya şifreyi hatalı girdiniz. Lütfen kontrol ediniz.'),
        action: SnackBarAction(
          textColor: Color(0xffffffff),
          label: 'Tamam',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  });
}
