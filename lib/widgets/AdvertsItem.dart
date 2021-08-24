import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/pages/AdvertsDetailScreen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdvertsItem extends StatelessWidget {
  Advers? snapshot;

  AdvertsItem(this.snapshot);
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Center(
      child: ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: snapshot!.advers.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 3, left: 8, right: 8, bottom: 3),
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdvertsDetailScreen(
                      snapshot!.advers[index].companyName,
                      snapshot!.advers[index].companyLocaliton,
                      snapshot!.advers[index].companyIcon,
                      snapshot!.advers[index].companyDesc,
                      snapshot!.advers[index].adversDate,
                      snapshot!.advers[index].wayOfWorking,
                      snapshot!.advers[index].adversAbout,
                      snapshot!.advers[index].adversTitle,
                      snapshot!.advers[index].adversDescription,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(0),
                      color: Colors.white,
                      width: width * 0.2,
                      height: 80,
                      child: Image.network(snapshot!.advers[index].companyIcon),
                    ),
                    Container(
                      width: width * 0.65,
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot!.advers[index].adversTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'Nunito'),
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time_outlined, size: 12),
                              Text(
                                snapshot!.advers[index].wayOfWorking,
                                style: TextStyle(
                                    fontFamily: 'Nunito', fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 12),
                              Text(
                                snapshot!.advers[index].companyName + ' - ',
                                style: TextStyle(
                                    fontSize: 11, fontFamily: 'Nunito'),
                              ),
                              Text(
                                snapshot!.advers[index].companyLocaliton,
                                style: TextStyle(
                                    fontSize: 11, fontFamily: 'Nunito'),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.date_range_outlined, size: 12),
                              Text(
                                snapshot!.advers[index].adversDate,
                                style: TextStyle(
                                    fontSize: 12, fontFamily: 'Nunito'),
                              ),
                            ],
                          ),
                          Container(
                            height: 3,
                          ),
                          Text(
                            snapshot!.advers[index].adversDescription.length >
                                    120
                                ? (snapshot!.advers[index].adversDescription
                                        .substring(0, 120)) +
                                    '...'
                                : (snapshot!.advers[index].adversDescription),
                            style:
                                TextStyle(fontSize: 11, fontFamily: 'Nunito'),
                          ),
                          //Button
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
/* 

 snapshot!.advers[index].adversAbout.length > 140
                                ? (snapshot!.advers[index].adversAbout
                                        .substring(0, 140)) +
                                    '...'
                                : (snapshot!.advers[index].adversAbout),*/

                                