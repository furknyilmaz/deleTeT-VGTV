import 'package:deletedvgtv/models/company_model.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:deletedvgtv/widgets/CompanyItem.dart';
import 'package:flutter/material.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  late Company company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: FutureBuilder(
        future: getCompany(companyAPI),
        builder: (context, AsyncSnapshot<Company> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return CompanyItem(snapshot.data);
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
