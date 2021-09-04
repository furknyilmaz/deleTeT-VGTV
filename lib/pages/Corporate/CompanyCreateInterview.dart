import 'package:flutter/material.dart';

class CreateInterview extends StatefulWidget {
  const CreateInterview({Key? key}) : super(key: key);

  @override
  _CreateInterviewState createState() => _CreateInterviewState();
}

class _CreateInterviewState extends State<CreateInterview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
        title: Text('Mülakat Oluştur'),
      ),
      body: Center(
        child: Text('Mülakat Oluştur'),
      ),
    );
  }
}
