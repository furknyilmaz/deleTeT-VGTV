import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/widgets/Corporate/CompanyApplicationAdversInfo.dart';
import 'package:deletedvgtv/widgets/Corporate/CompanyApplicationButton.dart';
import 'package:deletedvgtv/widgets/Corporate/CompanyApplicationUserProfile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompanyApplicationDetailScreen extends StatefulWidget {
  const CompanyApplicationDetailScreen({Key? key}) : super(key: key);

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
      body: FutureBuilder<List<Advers>>(
        future: fetchAdvers(http.Client()),
        builder: (context, snapshot) {
          print(snapshot.error);
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Icon(Icons.dangerous),
                  Text('Bir hata ile karşılaşıldı'),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: SafeArea(
                child: Container(
                  color: Colors.grey.shade100,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CompanyApplicationUserProfile(),
                        CompanyApplicationAdvertsInfo(),
                        CompanyApplicationButton(),
                      ],
                    ),
                  ),
                ),
              ),
            );
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
