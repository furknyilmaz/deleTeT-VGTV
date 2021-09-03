import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
        child: TextButton(
            onPressed: () {
              DatePicker.showDateTimePicker(context,
                  showTitleActions: true,
                  minTime: DateTime.now(),
                  maxTime: DateTime(2025, 6, 7), onChanged: (date) {
                setState(() {
                  currentDate = date;
                });
              }, onConfirm: (date) {
                print('confirm $date');
              }, currentTime: currentDate, locale: LocaleType.tr);
            },
            child: Text(
              'Mülakat Tarihi Oluşturun\n\n' + currentDate.toString(),
              style: TextStyle(color: Colors.blue),
            )),
      ),
    );
  }
}
