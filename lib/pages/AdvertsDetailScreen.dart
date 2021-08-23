import 'package:flutter/material.dart';

class AdvertsDetailScreen extends StatelessWidget {
  final String companyName;
  final String imageUri;
  final String advertsDetails;
  final String advertstitleDetails;

  AdvertsDetailScreen(this.imageUri, this.advertsDetails, this.companyName,
      this.advertstitleDetails);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;

    var color = const Color(0xffc1def8);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(69, 123, 157, 1),
          title: Text('İlan Bilgileri'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: SafeArea(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 120.0,
                          height: 120.0,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(75),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade300),
                                  image: new DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: new NetworkImage(imageUri)))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 2),
                          child: Text(
                            companyName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 0, left: 20, right: 20, bottom: 15),
                          child: Text(
                            advertstitleDetails,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 30),
                          child: Text(
                            advertsDetails,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    child: Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
  }
}

class InterviewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var birthday = DateTime(2021, 8, 21);
    var date2 = DateTime.now();
    var difference = birthday.difference(date2).inHours;
    var time = difference % 24;
    var day2 = (difference - time) / 24;
    // ignore: unused_local_variable
    var day = day2.toInt();
    return Column(
      children: [
        Container(
          height: 1,
          margin: EdgeInsets.all(10),
          color: Colors.grey.shade300,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text('Mülakat Zamanı'),
        ),
        Text(
          '23 Ağustos 2021 Pazartesi',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Text(
          'Saat: 10.30',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
        ElevatedButton(
          onLongPress: () {
            print('selam');
          },
          onPressed: () {},
          child: Text("Mülakata Katıl"),
        ),
      ],
    );
  }
}

/* 
 child: Text(day.toString() +
              ' Gün ' +
              time.toString() +
              ' saat sonra katılabilirisiniz'),
*/