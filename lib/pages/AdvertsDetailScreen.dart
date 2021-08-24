import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AdvertsDetailScreen extends StatelessWidget {
  final Adver advers;

  AdvertsDetailScreen(this.advers);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;

    var color = const Color(0xffffffff);

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
                                      image: new NetworkImage(
                                          advers.companyIcon)))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 2),
                          child: Text(
                            advers.adversTitle,
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
                            advers.companyName,
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
                            advers.adversDescription,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Html(data: advers.adversAbout),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 35.0,
                                      width: width * 0.8,
                                      color: Colors.blue,
                                      child: Center(
                                        child: Text(
                                          'Başvur',
                                          style: TextStyle(
                                              fontFamily: 'Nunito',
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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


/* 
 child: Text(day.toString() +
              ' Gün ' +
              time.toString() +
              ' saat sonra katılabilirisiniz'),
*/