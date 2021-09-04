import 'package:deletedvgtv/models/company_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

// ignore: must_be_immutable
class CompanyDetail extends StatelessWidget {
  Company? snapshot;
  int index;

  @override
  CompanyDetail(this.snapshot, this.index);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(69, 123, 157, 1),
          title: Text(
            'Firma Detayları',
            style: TextStyle(fontFamily: 'Nunito'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.4, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: width,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        padding: EdgeInsets.all(5),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: 150,
                          height: 200,
                          color: Colors.white,
                          child: Image.network(snapshot!.companyUrl),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.4, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.group_outlined, size: 20),
                                Text(
                                  ' ' + snapshot!.employeeCount.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Nunito', fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.business_outlined, size: 18),
                                Text(
                                  ' ' + snapshot!.companyDepartment,
                                  style: TextStyle(
                                      fontFamily: 'Nunito', fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined, size: 18),
                                Text(
                                  ' ' + snapshot!.establishment,
                                  style: TextStyle(
                                      fontFamily: 'Nunito', fontSize: 14),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Text(
                              snapshot!.companyName,
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Container(
                            width: width,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Html(
                              data: snapshot!.companyAbout,
                              style: {
                                "body": Style(
                                  fontFamily: 'Nunito',
                                  fontSize: FontSize(14.0),
                                  fontWeight: FontWeight.normal,
                                ),
                              },
                            ),
                            /*
                            Text(
                              snapshot!.contact +
                                  snapshot!.contact +
                                  snapshot!.contact +
                                  snapshot!.contact,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Nunito'),
                            ), */
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 3, left: 10),
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.phone_android, size: 22),
                                    Container(
                                      child: Text(
                                        '  İletişim Bilgileri',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(height: 0.5, color: Colors.grey.shade400),
                          Container(height: 10),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined,
                                          size: 18),
                                      Container(
                                        padding: EdgeInsets.only(left: 8),
                                        width: width * 0.75,
                                        child: Text(
                                          snapshot!.website,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            width: width,
                          ),
                          Container(height: 10),
                          Container(
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.language_outlined, size: 18),
                                      Container(
                                        padding: EdgeInsets.only(left: 8),
                                        width: width * 0.75,
                                        child: Text(
                                          snapshot!.address,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(height: 10),
                          Container(
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.phone, size: 18),
                                      Container(
                                        padding: EdgeInsets.only(left: 8),
                                        width: width * 0.75,
                                        child: Text(
                                          snapshot!.contact,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                '',
                                style: TextStyle(
                                    fontSize: 25, fontFamily: 'Nunito'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: width / 2 - 20,
                                height: width / 10,
                              ),
                              Container(
                                width: width / 2 - 20,
                                height: width / 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
