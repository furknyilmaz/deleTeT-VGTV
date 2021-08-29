import 'package:deletedvgtv/pages/LoginScreen.dart';
import 'package:deletedvgtv/pages/RegisterScreen.dart';
import 'package:deletedvgtv/widgets/BottomMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());
var tfUsername = TextEditingController();
var tfPassword = TextEditingController();

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Future<bool> Control() async {
    var sp = await SharedPreferences.getInstance();
    String? username = sp.getString("user_id");
    if (username != null) {
      print(username);

      return true;
    } else {
      return false;
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
      home: FutureBuilder<bool>(
        future: Control(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool? ok = snapshot.data;
            return ok == true ? BottomMenu() : LoginScreenPage(info: '');
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
