import 'package:flutter/material.dart';

class ForumDetailScreen extends StatefulWidget {
  const ForumDetailScreen({Key? key}) : super(key: key);

  @override
  _ForumDetailScreenState createState() => _ForumDetailScreenState();
}

class _ForumDetailScreenState extends State<ForumDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
        title: Text(
          'Forum Detay',
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
      body: Text('Selam'),
    );
  }
}
