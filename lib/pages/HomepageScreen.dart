import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'IDEF21 Uluslararası Savunma Sanayi Fuarında yerlerimizi aldık.',
      'ROBOTİK 2021 İnsansız Su Üstü Araçları Protatip Yarışması başvuruları başladı',
      'Kabi Partners Bilişim Teknoljilerinin iş ve staj ilanları artık vizyonergenc.com da',
    ];
    final List<String> imageUri = <String>[
      "https://vizyonergenc.com/storage/posts/586576/yatay%20%289%29.png",
      "https://vizyonergenc.com/storage/posts/586561/yatay%20%288%29.png",
      "https://vizyonergenc.com/storage/posts/586441/Yatay.jpg"
    ];

    final List<String> date = <String>["7", "8", "12"];

    return Scaffold(
        body: Center(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '  ${date[index]} saat önce',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 20,
                          ),
                          Text('${entries[index]}'),
                          Container(
                            height: 20,
                          ),
                          Image.network(imageUri[index]),
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
                                      '  ${date[index]} beğeni',
                                    )
                                  ],
                                ),
                                Text('34 Yorum')
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
                })));
  }
}
//Text('Entry ${entries[index]}')