import 'package:deletedvgtv/models/company_model.dart';
import 'package:deletedvgtv/pages/CompanyDetailScreen.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompanyItem extends StatelessWidget {
  Company? snapshot;

  @override
  CompanyItem(this.snapshot);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    final double itemWidth = (width / 2) - 25;
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: width,
          child: Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Row(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(69, 123, 157, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      margin: EdgeInsets.only(top: 20, left: 15),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: Text('Savunma Sanayi',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Nunito')),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Eğitim',
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Nunito'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 5),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text('Araştırma',
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Nunito')),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text('Bilişim',
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Nunito')),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 0),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text('Motor Sanayi',
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Nunito')),
                    ),
                  ])),
              Container(
                margin: EdgeInsets.only(bottom: 0),
                width: width,
                height: 2,
                color: Colors.grey.shade200,
              )
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            addSemanticIndexes: false,
            crossAxisCount: 2,
            padding: EdgeInsets.all(10),
            children: List.generate(snapshot!.company.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompanyDetail(snapshot, index),
                      //Listeden hangi firmanın üzerine tıklanırsa o firmanın indexi aktarılır
                    ),
                  );
                },
                child: Center(
                  child: Container(
                    width: itemWidth,
                    height: itemWidth,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 0.6, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                        child: ImageCached(
                            width: itemWidth - 50,
                            height: itemWidth - 50,
                            url: snapshot!.company[index].imageUrl)),
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
