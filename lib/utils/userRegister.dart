import 'dart:convert';
import 'package:deletedvgtv/models/login_model.dart';
import 'package:deletedvgtv/pages/ProfileInfoScreen.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/widgets/CompanyBottomMenu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> userRegister(requestModal, context) async {
  UserAPIServices apiServices = new UserAPIServices();
  apiServices
      .register(requestModal, 'http://89.252.131.149:8080/api/deletet/register')
      .then((response) async {
    if (response.statusCode == 200) {
      var data = LoginResponseModal.fromJson(json.decode(response.body));
      var sp = await SharedPreferences.getInstance();
      sp.setString("user_id", data.id.toString());
      sp.setString("user_email", data.email.toString());
      sp.setString("role", data.appUserRole.toString());
      var id = data.id.toString();
      var role = data.appUserRole.toString();
      print(role);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => role == 'USER'
                ? ProfileInfo(
                    id: id,
                    info:
                        'Kaydınız başarıyla oluşturuldu. Lütfen aşağıdaki bilgileri doldurun.')
                : CompanyBottomMenu()),
      );
    } else {
      final snackBar = SnackBar(
        backgroundColor: Color(0xffE63946),
        content: Text(
            'Bu mail adresi ile daha önce kayıt olunmuş. Lütfen giriş yapmayı deneyiniz'),
        action: SnackBarAction(
            textColor: Color(0xffffffff), label: 'Tamam', onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  });
}

Future<void> profileUpdate(requestModal, context, id) async {
  UserAPIServices apiServices = new UserAPIServices();
  apiServices
      .updateProfile(
          requestModal,
          'http://89.252.131.149:8080/api/deletet/profile/update/' +
              id.toString())
      .then((response) async {
    if (response.statusCode == 200) {
      // var data = RegisterResponseModal.fromJson(json.decode(response.bodt));
    } else {
      final snackBar = SnackBar(
        backgroundColor: Color(0xffE63946),
        content: Text(
            'Kullanıcı adı veya şifreyi hatalı girdiniz. Lütfen kontrol ediniz.'),
        action: SnackBarAction(
            textColor: Color(0xffffffff), label: 'Tamam', onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  });
}
