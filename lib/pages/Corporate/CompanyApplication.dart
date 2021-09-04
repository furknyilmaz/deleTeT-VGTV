import 'package:deletedvgtv/models/Corporote/application_company_model.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/widgets/Corporate/CompanyApplicationItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class CompanyApplications extends StatefulWidget {
  CompanyApplications(this.adverstID, this.companyID);
  int adverstID;
  int companyID;
  @override
  _CompanyApplicationsState createState() => _CompanyApplicationsState();
}

class _CompanyApplicationsState extends State<CompanyApplications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İlana Başvurunlar",
          style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
        ),
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
      ),
      body: FutureBuilder<List<ApplicationCompany>>(
        future: fetchCompanyApplication(
            http.Client(), widget.adverstID, widget.companyID),
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
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outlined, size: 70, color: Colors.black45),
                    Text('Bu İlana Hiç Başvuru Yapılmamış',
                        style: TextStyle(fontFamily: 'Nunito')),
                  ],
                ),
              );
            }
            return CompanyApplicationItem(
                data: snapshot.data!, id: widget.adverstID);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
