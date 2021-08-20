import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String myTitle;
  final String decr;

  ProfileScreen(this.myTitle, this.decr);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(myTitle + decr),
    ));
  }
}
