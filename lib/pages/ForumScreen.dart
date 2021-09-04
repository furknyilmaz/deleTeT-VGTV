import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/pages/ForumDetailsScreen.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForumScreen extends StatefulWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  _ForumScreen createState() => _ForumScreen();
}

class _ForumScreen extends State<ForumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: FutureBuilder<List<Advers>>(
        future: fetchAdvers(http.Client()),
        builder: (context, snapshot) {
          print(snapshot.error);
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Icon(Icons.dangerous),
                  Text('Bir hata ile karşılaşıldı'),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: ForumItem(data: snapshot.data!),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Soru Ekle',
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class ForumItem extends StatefulWidget {
  const ForumItem({Key? key, required this.data}) : super(key: key);
  final List<Advers> data;

  @override
  _ForumItemState createState() => _ForumItemState();
}

class _ForumItemState extends State<ForumItem> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    var datamin = [
      "JavaSplite ile Jar Oluşturma",
      "C++ da pointer tanımı yapamıyorum",
      "Python ile Jupiter kullanımı yardım!!!",
      "Flutter'da REST API Future bağlantısı"
    ];

    var image = [
      "https://www.bitcoinsistemi.com/wp-content/uploads/2021/02/elon-musk.jpg",
      "https://i4.hurimg.com/i/hurriyet/75/750x0/5d78ff7845d2a023a0d6b805.jpg",
      "https://images.bursadabugun.com/galeriler/2012/08/14/2225-unlulerin-profil-fotograflari-502a42e60ff03.jpg",
      "http://www.buseterim.com.tr/upload/default/2018/4/20/profilestetik680.jpg"
    ];

    var name = ["Elon Musk", "Murat Boz", "Cansu Tabak", "Meryem Güneş"];
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForumDetailScreen(),
                  //Listeden hangi firmanın üzerine tıklanırsa o firmanın indexi aktarılır
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(width: 0.6, color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.5, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(40),
                                image: new DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: new NetworkImage(image[index]),
                                )),
                            width: 40,
                            height: 40,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: width * 0.65,
                                  child: Text(
                                    datamin[index],
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ),
                                Container(height: 2),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      name[index],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Nunito',
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(width: 20),
                                    Icon(
                                      Icons.fiber_manual_record_rounded,
                                      size: 10,
                                      color: Colors.green,
                                    ),
                                    Text(
                                      '10 dakika önce',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Nunito',
                                          fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.bookmark_border_rounded,
                        color: Colors.grey.shade700,
                      )
                    ],
                  ),
                  Container(height: 15),
                  Container(
                    width: width,
                    child: Text(
                      'Herkese Merhaba, öncelikle Spring Boot nedir, ne işe yaramaktadır bununla başlayalım. Kendi sitesindeki tanımına göre Spring Boot, bize uygulama oluşturmanın... ',
                      style: TextStyle(fontFamily: 'Nunito'),
                      maxLines: 3,
                      softWrap: true,
                    ),
                  ),
                  Container(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_circle_up_outlined,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                          Text(
                            ' 67',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.thumb_up_rounded,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                          Text(
                            ' 12',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_outlined,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                          Text(
                            ' 32',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
