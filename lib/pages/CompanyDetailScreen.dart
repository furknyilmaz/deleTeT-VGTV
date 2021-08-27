import 'package:deletedvgtv/models/company_model.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
        body: SingleChildScrollView(
          child: Container(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: ImageCached(
                    url: snapshot!.companyUrl,
                  ),
                ),
                Html(data: snapshot!.companyAbout),
              ],
            ),
          ),
        ));
  }
}
