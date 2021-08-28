import 'package:deletedvgtv/models/company_model.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/widgets/CompanyItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<List<Company>>(
          future: fetchCompany(
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
                        'deneme',
                        style: TextStyle(fontFamily: 'Nunito'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasData) {
              return CompanyItem(data: snapshot.data!);
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
