import 'package:deletedvgtv/models/newsfeed_modal.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late Newsfeed newsfeed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getFeedNews(newsfeedAPI),
        builder: (context, AsyncSnapshot<Newsfeed> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            debugPrint(snapshot.data!.newsfeed[0].title);
            return HomePageFeedItem(snapshot.data);
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class HomePageFeedItem extends StatefulWidget {
  Newsfeed? snapshot;

  @override
  HomePageFeedItem(this.snapshot);

  @override
  _HomePageFeedItemState createState() => _HomePageFeedItemState();
}

class _HomePageFeedItemState extends State<HomePageFeedItem> {
  bool readMore = true;
  String text =
      'TUSAŞ İnsan Kaynakları ekibi, TR Eğitim ve Teknoloji A.Ş. Yönetim Kurulu Başkanı ve Genel Müdürü Çağlar Demirkan ve Vizyoner Genç ekibini ziyaret etti.Ziyaret sırasında gerçekleştirilebilecek projeler üzerine fikir alışverişi yapıldı ve olası projeler ile ilgili görüşmeler gerçekleştirildi.';

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Center(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: widget.snapshot!.newsfeed.length,
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
                            height: 40,
                            child: Image.asset("assets/vg.png"),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "  Vizyoner Genç",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito'),
                              ),
                              Text(
                                "   " +
                                    widget.snapshot!.newsfeed[index].timeAgo,
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
                        height: 20,
                      ),
                      readMore
                          ? Text(
                              text.length > 150
                                  ? text.substring(0, 150) + '...'
                                  : text,
                              style: TextStyle(fontFamily: 'Nunito'),
                            )
                          : Text(
                              text,
                              style: TextStyle(fontFamily: 'Nunito'),
                            ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              readMore = !readMore;
                            });
                          },
                          child: Text(
                            readMore ? 'Devamını Oku...' : 'Küçült',
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                      ),
                      Container(
                        width: width,
                        height: width * (9 / 16),
                        child: ImageCached(
                          url: widget.snapshot!.newsfeed[index].imageUri,
                        ),
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
                                  size: 35,
                                  color: Colors.red[800],
                                ),
                                Text(
                                  '${widget.snapshot!.newsfeed[index].likeCount} beğeni',
                                )
                              ],
                            ),
                            Text(
                              '  ${widget.snapshot!.newsfeed[index].commentCount} yorum',
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
            }));
  }
}
