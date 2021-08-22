import 'package:deletedvgtv/models/company_model.dart';
import 'package:deletedvgtv/pages/CompanyDetailScreen.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: GridView.count(
        addSemanticIndexes: true,
        crossAxisCount: 2,
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
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.6, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  child: Image.network(
                    snapshot!.company[index].imageUri,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
