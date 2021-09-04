import 'package:flutter/material.dart';

class CompanyInterview extends StatefulWidget {
  const CompanyInterview({Key? key}) : super(key: key);

  @override
  _CompanyInterviewState createState() => _CompanyInterviewState();
}

DateTime? currentDate;

class _CompanyInterviewState extends State<CompanyInterview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Mülakat'),
      ),
    );
  }
}
