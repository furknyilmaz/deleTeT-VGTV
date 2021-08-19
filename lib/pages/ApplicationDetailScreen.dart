import 'package:flutter/material.dart';

class ApplicationDetailScreen extends StatelessWidget {
  final String title;
  final String imageUri;
  final String applicationDetails;
  final String statusState;

  ApplicationDetailScreen(
      this.imageUri, this.applicationDetails, this.title, this.statusState);

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
                          color: statusState == "1"
                              ? Colors.blue[100]
                              : statusState == "2"
                                  ? Colors.amber[100]
                                  : statusState == "3"
                                      ? Colors.green[100]
                                      : Colors.red[100],
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          statusState == "1"
                              ? "Başvurunuz alındı..."
                              : statusState == "2"
                                  ? "Başvurunuz İnceleniyor..."
                                  : statusState == "3"
                                      ? "Olumlu Sonuçlandı. Mülakata bekleniyor..."
                                      : "Olumsuz Sonuçlandı...",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50, left: 30, right: 30),
                        child: Text(
                          // ignore: unnecessary_brace_in_string_interps
                          "12 Ocak 2021 belirtilen şirkete ait ${title}  pozisyonu için yapmış olduğunuz başvurunuz kabul edilmiştir. Firma yetkilileri en kısa zamanda sizinle iletişime geçecektir",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
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
