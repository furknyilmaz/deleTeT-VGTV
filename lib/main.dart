import 'package:deletedvgtv/pages/LoginScreen.dart';
import 'package:deletedvgtv/widgets/BottomMenuWidget.dart';
import 'package:deletedvgtv/widgets/CompanyBottomMenu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());
var tfUsername = TextEditingController();
var tfPassword = TextEditingController();

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Future<String> Control() async {
    var sp = await SharedPreferences.getInstance();
    String? username = sp.getString("user_id");
    String? role = sp.getString("role");
    if (username != null) {
      if (role == 'USER') {
        return '1';
      } else if (role == 'COMPANY') {
        return '2';
      } else {
        return '3';
      }
    } else {
      return '3';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder<String>(
        future: Control(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String? ok = snapshot.data;
            return ok == '3'
                ? LoginScreenPage(info: '')
                : ok == '2'
                    ? CompanyBottomMenu()
                    : BottomMenu();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
