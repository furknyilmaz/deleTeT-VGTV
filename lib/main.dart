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

  // ignore: non_constant_identifier_names
  Future<bool> Control() async {
    var sp = await SharedPreferences.getInstance();
    String? username = sp.getString("user_id");

    if (username != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello World Flutter Application',
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
                return ok == true ? BottomMenu() : LoginScreenPage();
              } else {
                return Container();
              }
            })
        //MyHomePage(title: 'Home page'),
        );
  }
}

//BottomMenu(),

// ignore: must_be_immutable
class LoginRegisterButton extends StatelessWidget {
  String text, buttonText;
  LoginRegisterButton(this.text, this.buttonText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Text(text),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
              child: Text(
                buttonText,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
