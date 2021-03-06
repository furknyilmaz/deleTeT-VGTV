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
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.5, color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.only(top: 2, left: 8, right: 8, bottom: 2),
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
                        padding: EdgeInsets.all(0),
                        width: width * 0.20,
                        height: width * 0.20,
                        child: ImageCached(
                            url: data[index].companyIcon,
                            width: width * 0.4,
                            height: width * 0.4)),
                    Container(
                      width: width * 0.68,
                      padding: EdgeInsets.only(left: 10, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              data[index].advertsTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time_outlined, size: 12),
                              Text(
                                data[index].wayOfWorking + ' - ',
                                style: TextStyle(
                                    fontFamily: 'Nunito', fontSize: 12),
                              ),
                              Text(
                                data[index].companyLocation,
                                style: TextStyle(
                                    fontSize: 11, fontFamily: 'Nunito'),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined, size: 12),
                              Container(
                                width: width * 0.6,
                                child: Text(
                                  data[index].companyName,
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: 'Nunito'),
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.date_range_outlined, size: 12),
                              Text(
                                data[index].advertsDate,
                                style: TextStyle(
                                    fontSize: 11, fontFamily: 'Nunito'),
                              ),
                            ],
                          ),
                          Container(
                            height: 3,
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
