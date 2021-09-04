import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/models/application_add_modal.dart';
import 'package:deletedvgtv/utils/applicationAdd.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CompanyAdverts extends StatefulWidget {
  final Advers advers;

  CompanyAdverts(this.advers);

  @override
  _CompanyAdvertsState createState() => _CompanyAdvertsState();
}

class _CompanyAdvertsState extends State<CompanyAdverts> {
  bool status = true;
  @override
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;

    print(widget.advers);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(69, 123, 157, 1),
          title: Text('İlan Bilgileri'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: SafeArea(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border:
                            Border.all(width: 0.5, color: Colors.grey.shade300),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              width: 150,
                              height: 150,
                              margin: EdgeInsets.all(0),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 0.5, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                  child: ImageCached(
                                      url: widget.advers.companyIcon)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 2),
                            child: Text(
                              widget.advers.advertsTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 20, right: 20, bottom: 5),
                            child: Text(
                              widget.advers.companyName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: Text(
                              widget.advers.companyDesc,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontFamily: 'Nunito'),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            border: Border.all(
                                width: 0.5, color: Colors.grey.shade300),
                          ),
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 20),
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Html(
                                data: widget.advers.advertsTitle,
                                style: {
                                  "body": Style(
                                    fontFamily: 'Nunito',
                                    fontSize: FontSize(14.0),
                                    fontWeight: FontWeight.normal,
                                  ),
                                },
                              ),
                              Container(
                                width: width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.6, color: Colors.grey.shade300),
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Icon(Icons.navigate_next_outlined),
                                    Text(
                                      "Firma sayfasını ziyaret et",
                                      style: TextStyle(fontFamily: 'Nunito'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
  }
}

class OkApplicationButton extends StatelessWidget {
  const OkApplicationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.6, color: Colors.green),
                color: Colors.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              width: width * 0.8,
              height: 40,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.thumb_up_outlined,
                        color: Colors.white, size: 18),
                    Text(
                      ' İlana Başvuruldu',
                      style:
                          TextStyle(fontFamily: 'Nunito', color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* 
 child: Text(day.toString() +
              ' Gün ' +
              time.toString() +
              ' saat sonra katılabilirisiniz'),
*/

// ignore: must_be_immutable
class ApplicationAdd extends StatelessWidget {
  String? company;
  String? adversTitle;
  String? image;
  bool status;
  late ApplicationAddModal applicationModal;
  ApplicationAdd({
    this.company,
    this.adversTitle,
    this.image,
    required this.applicationModal,
    required this.status,
  });
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              // ignore: unnecessary_brace_in_string_interps
              '${company} şirketi tarafından yayınlanan ${adversTitle} ilanına başvurmak istediğinize emin misiniz?',
              style: TextStyle(fontFamily: 'Nunito'),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(
                context,
                'OK',
              ),
              child: const Text('İptal'),
            ),
            TextButton(
              onPressed: () => {
                Navigator.pop(context, 'OK'),
                setApplicationAdd(applicationModal, context)
              },
              child: const Text('Başvur'),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.6, color: Colors.green),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: width * 0.8,
                height: 40,
                child: Center(
                  child: Text(
                    status ? 'İlana Başvur' : 'İlana Başvuruldu',
                    style: TextStyle(fontFamily: 'Nunito', color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  fetchApplicationAdd() {}
}
