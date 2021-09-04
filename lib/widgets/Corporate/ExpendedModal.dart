import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemModel {
  bool expanded;
  String headerItem;
  String discription;
  Color colorsItem;
  String img;

  ItemModel(
      {this.expanded: false,
      required this.headerItem,
      required this.discription,
      required this.colorsItem,
      required this.img});
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: itemData.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionPanelList(
            animationDuration: Duration(milliseconds: 1000),
            dividerColor: Colors.red,
            elevation: 0,
            children: [
              ExpansionPanel(
                body: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.amber,
                        width: 400,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'TC Kimlik No: ' + '25085696146',
                                style: TextStyle(fontFamily: 'Nunito'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Adres: ' + 'Mamak/ Ankara',
                                style: TextStyle(fontFamily: 'Nunito'),
                              ),
                            ),
                            //
                            //
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Email: ' + 'bahadirtiras@gmail.com',
                                style: TextStyle(fontFamily: 'Nunito'),
                              ),
                            ),
                            //
                            //
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Telefon Numarası: ' + '0541 504 78 62',
                                style: TextStyle(fontFamily: 'Nunito'),
                              ),
                            ),
                            //
                            //
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Websitesi: ' + 'www.bahadirtiras.com.tr',
                                style: TextStyle(fontFamily: 'Nunito'),
                              ),
                            ),
                            //
                            //
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Üniversite: ' + 'Marmara Üniversitesi',
                                style: TextStyle(fontFamily: 'Nunito'),
                              ),
                            ),
                            //
                            //
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Profil Puanı: ' + '87 Puan',
                                style: TextStyle(fontFamily: 'Nunito'),
                              ),
                            ),
                            //
                            //
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Forum Puanı: ' + '67 Puan',
                                style: TextStyle(fontFamily: 'Nunito'),
                              ),
                            ),
                            //
                            //
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      itemData[index].headerItem,
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700),
                    ),
                  );
                },
                isExpanded: itemData[index].expanded,
              )
            ],
            expansionCallback: (int item, bool status) {
              setState(() {
                itemData[index].expanded = !itemData[index].expanded;
              });
            },
          );
        },
      ),
    );
  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
        headerItem: 'Kişisel Bilgiler',
        discription:
            "Android is a mobile operating system based on a modified version of the Linux kernel and other open source software, designed primarily for touchscreen mobile devices such as smartphones and tablets. ... Some well known derivatives include Android TV for televisions and Wear OS for wearables, both developed by Google.",
        colorsItem: Colors.green,
        img: 'assets/images/android_img.png'),
  ];
}
