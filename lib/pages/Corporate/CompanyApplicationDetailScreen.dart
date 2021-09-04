import 'package:deletedvgtv/models/Corporote/application_company_model.dart';
import 'package:deletedvgtv/widgets/Corporate/CompanyApplicationButton.dart';
import 'package:deletedvgtv/widgets/Corporate/CompanyApplicationUserProfile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompanyApplicationDetailScreen extends StatefulWidget {
  ApplicationCompany? data;

  @override
  CompanyApplicationDetailScreen(this.data);

  @override
  _CompanyApplicationDetailScreenState createState() =>
      _CompanyApplicationDetailScreenState();
}

class _CompanyApplicationDetailScreenState
    extends State<CompanyApplicationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Başvuru Detayı',
            style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
          ),
          backgroundColor: Color.fromRGBO(69, 123, 157, 1),
        ),
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: SafeArea(
            child: Container(
              color: Colors.grey.shade100,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CompanyApplicationUserProfile(widget.data!.applicantId),
                    //CompanyApplicationAdvertsInfo(widget.data),
                    CompanyApplicationButton(
                      widget.data!.id,
                      widget.data!.status,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
