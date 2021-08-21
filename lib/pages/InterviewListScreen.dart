import 'package:flutter/material.dart';

class InterviewListScreen extends StatelessWidget {
  const InterviewListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mülakatarınız'),
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
      ),
      body: Center(
        child: Text('Mülakatlar listesi'),
      ),
    );
  }
}
