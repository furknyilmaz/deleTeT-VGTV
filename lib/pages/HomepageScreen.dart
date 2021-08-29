import 'package:deletedvgtv/models/newsfeed_modal.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late Newsfeed newsfeed;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    final double itemWidth = (width / 2) - 15;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: FutureBuilder<List<Newsfeed>>(
          future: fetchNewfeed(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
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
              return NewsFeedItem(data: snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class NewsFeedItem extends StatelessWidget {
  const NewsFeedItem({Key? key, required this.data}) : super(key: key);
  final List<Newsfeed> data;
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    final double itemWidth = (width / 2) - 15;
    return Center(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Container(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35,
                        child: Image.network(data[index].companyIconUrl),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '  ' + data[index].companyName,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito'),
                          ),
                          Text(
                            "  12 saat önce",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(data[index].newsDescription,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontFamily: 'Nunito')),
                  ),
                  Container(
                    width: width,
                    height: width * (9 / 16),
                    child: ImageCached(url: data[index].newsImage),
                  ),
                  Container(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 25,
                              color: Colors.red[400],
                            ),
                            Text(
                              ' ${data[index].likeCount}   ',
                              style: TextStyle(fontFamily: 'Nunito'),
                            ),
                            Icon(
                              Icons.comment,
                              size: 25,
                              color: Colors.black38,
                            ),
                            Text(
                              ' ${data[index].commentCount}',
                              style: TextStyle(fontFamily: 'Nunito'),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(
                                width: 0.5, color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Text(
                            data[index].newsTag,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 10,
                    color: Colors.grey[200],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
