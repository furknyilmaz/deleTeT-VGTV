import 'package:deletedvgtv/models/interview_model.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:deletedvgtv/widgets/InterviewItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
        title: Text(
          'Mülataklar',
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
        child: FutureBuilder<List<Interview>>(
          future: fetchInterview(
            http.Client(),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 60,
                      color: Colors.grey.shade700,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(fontFamily: 'Nunito'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              return InterviewItem(data: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
