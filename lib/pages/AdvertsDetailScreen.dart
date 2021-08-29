import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AdvertsDetailScreen extends StatelessWidget {
  final Advers advers;

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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border:
                            Border.all(width: 0.5, color: Colors.grey.shade300),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            width: 150.0,
                            height: 150.0,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade300),
                                    image: new DecorationImage(
                                        fit: BoxFit.contain,
                                        image: new NetworkImage(
                                            advers.companyIcon)))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 2),
                            child: Text(
                              advers.advertsTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 20, right: 20, bottom: 5),
                            child: Text(
                              advers.companyName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: Text(
                              advers.companyDesc,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Row(
                            children: [],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(
                                width: 0.5, color: Colors.grey.shade300),
                          ),
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 20),
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Html(
                                data: advers.advertsAbout,
                                style: {
                                  "body": Style(
                                    fontFamily: 'Nunito',
                                    fontSize: FontSize(14.0),
                                    fontWeight: FontWeight.normal,
                                  ),
                                },
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue,
                                      ),
                                      height: 35.0,
                                      width: width * 0.8,
                                      child: Center(
                                        child: Text(
                                          'İlana Başvur',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.0,
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
