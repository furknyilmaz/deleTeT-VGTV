import 'package:deletedvgtv/models/interview_model.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:deletedvgtv/widgets/InterviewItem.dart';
import 'package:flutter/material.dart';

class InretviewListScreen extends StatefulWidget {
  const InretviewListScreen({Key? key}) : super(key: key);

  @override
  _InretviewListScreenState createState() => _InretviewListScreenState();
}

class _InretviewListScreenState extends State<InretviewListScreen> {
  late Interview interview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
        title: Text(
          "Mülakatlarınız",
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
      body: FutureBuilder(
        future: getInterview(interviewAPI),
        builder: (context, AsyncSnapshot<Interview> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            debugPrint(snapshot.data!.interview[0].companyName);
            return InterviewItem(snapshot.data);
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        },
      ),
    );
  }
}
