import 'package:flutter/material.dart';

class ApplicationDetailScreen extends StatelessWidget {
  final String title;
  final String imageUri;
  final String applicationDetails;

  ApplicationDetailScreen(this.imageUri, this.applicationDetails, this.title);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(69, 123, 157, 1),
          title: Text('Başvuru Bilgileri'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout_outlined,
                size: 24,
              ),
            ),
          ],
        ),
        body: Container(
          child: SafeArea(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 150.0,
                        height: 150.0,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300),
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: new NetworkImage(imageUri)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: Text(
                          applicationDetails,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Başvurunuz Kabul Edildi.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Başvuru Adı:' + title),
                              Text('Başvuru Tarihi:' + '12 ocak 2021'),
                              Text('Başvuru Detayı:' +
                                  'Firmamızda yetiştirmek üzere Flutter ve Vue Js ile mühendsislik sistemlerinden kullanılacak uygulamalar geliştirmesi istenmektedir.'),
                              Text('Başvuru Tarihi:' + '12 ocak 2021'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
          ),
        ));
  }
}
