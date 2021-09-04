import 'package:deletedvgtv/models/interview_model.dart';
import 'package:deletedvgtv/widgets/InterviewButton.dart';
import 'package:flutter/material.dart';

class InterviewScreen extends StatelessWidget {
  final Interview data;
  InterviewScreen(this.data);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var moonLanding = DateTime.parse(data.interDate);
    var milisec =
        (moonLanding.microsecondsSinceEpoch - now.microsecondsSinceEpoch);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(69, 123, 157, 1),
          title: Text(
            'Mülakat Detayları',
            style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
          ),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border.all(width: 1, color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      UsersTable(
                          data), //////////////////////////////////////////////////
                      Container(
                        height: 1,
                        color: Colors.grey.shade200,
                        margin: EdgeInsets.all(10),
                      ),
                      ApplicationInfo(
                          data), //////////////////////////////////////////////////
                    ],
                  ),
                ),
                InterviewInfo(
                    data), //////////////////////////////////////////////////
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    border: Border.all(width: 0.6, color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      InterviewButton(
                          channelName: 'vgtv',
                          time: milisec,
                          interId: data.id,
                          applicantId: data.applicantId),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}

class UsersTable extends StatelessWidget {
  final Interview data;
  UsersTable(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.6, color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  width: 80,
                  height: 75,
                  child: Image.network(data.companyIcon),
                ),
                Text(
                  data.companyName,
                  style: TextStyle(
                      fontFamily: 'Nunito', fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Icon(
            Icons.swap_horiz_outlined,
            size: 50,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.6, color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 0.6, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(40),
                      image: new DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: new NetworkImage(data.applicantIcon),
                      )),
                  width: 75,
                  height: 75,
                ),
                Text(
                  data.applicantName,
                  style: TextStyle(
                      fontFamily: 'Nunito', fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ApplicationInfo extends StatelessWidget {
  final Interview data;
  ApplicationInfo(this.data);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          data.title,
          style: TextStyle(
              fontFamily: 'Nunito', fontWeight: FontWeight.w700, fontSize: 18),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Text(
            data.applicationDesc,
            style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.normal,
                fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class InterviewInfo extends StatelessWidget {
  final Interview data;
  InterviewInfo(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 25),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(width: 1, color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Mülakat Bilgileri',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person_outlined),
              Text(
                '  Firma Yetkilisi: ' + data.companyOfficer,
                style: TextStyle(fontFamily: 'Nunito'),
              )
            ],
          ),
          Container(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.badge_outlined),
              Text(
                '  Yetkili Departman: İnsan Kaynakları',
                style: TextStyle(fontFamily: 'Nunito'),
              ),
            ],
          ),
          Container(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.event_outlined),
              Text(
                '  Mülakat Tarihi: 25 Kasım 2021 09.30',
                style: TextStyle(fontFamily: 'Nunito'),
              )
            ],
          ),
          Container(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.integration_instructions_outlined),
              Text(
                '  Başvurulan Pozisyon: Junior Developer',
                style: TextStyle(fontFamily: 'Nunito'),
              )
            ],
          ),
          Container(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_city_outlined),
              Text(
                '  Firma Konumu: Ankara',
                style: TextStyle(fontFamily: 'Nunito'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
