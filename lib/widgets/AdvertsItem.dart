import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/pages/AdvertsDetailScreen.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdvertsItem extends StatelessWidget {
  const AdvertsItem({Key? key, required this.data}) : super(key: key);
  final List<Advers> data;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Center(
      child: ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 3, left: 8, right: 8, bottom: 3),
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdvertsDetailScreen(data[index]),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.5, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.all(0),
                        width: width * 0.22,
                        height: width * 0.25,
                        child: ImageCached(
                            url: data[index].companyIcon,
                            width: width * 0.3,
                            height: width * 0.3)),
                    Container(
                      width: width * 0.70,
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              data[index].adversTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time_outlined, size: 12),
                              Text(
                                data[index].wayOfWorking,
                                style: TextStyle(
                                    fontFamily: 'Nunito', fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 12),
                              Text(
                                data[index].companyName + ' - ',
                                style: TextStyle(
                                    fontSize: 11, fontFamily: 'Nunito'),
                              ),
                              Text(
                                data[index].companyLocaliton,
                                style: TextStyle(
                                    fontSize: 11, fontFamily: 'Nunito'),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.date_range_outlined, size: 12),
                              Text(
                                data[index].adversDate,
                                style: TextStyle(
                                    fontSize: 12, fontFamily: 'Nunito'),
                              ),
                            ],
                          ),
                          Container(
                            height: 3,
                          ),
                          Text(
                            data[index].adversDescription.length > 100
                                ? (data[index]
                                        .adversDescription
                                        .substring(0, 100)) +
                                    '...'
                                : (data[index].adversDescription),
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

                                