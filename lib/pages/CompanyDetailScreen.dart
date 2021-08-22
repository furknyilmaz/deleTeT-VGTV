import 'package:deletedvgtv/models/company_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompanyDetail extends StatelessWidget {
  Company? snapshot;
  int index;
  @override
  CompanyDetail(this.snapshot, this.index);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(69, 123, 157, 1),
          title: Text('Firma Detayları'),
        ),
        body: Container(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Image.network(snapshot!.company[index].imageUri),
              ),
              Text(snapshot!.company[index].title),
            ],
          ),
        ));
  }
}
