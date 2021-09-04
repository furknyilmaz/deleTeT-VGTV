import 'package:deletedvgtv/models/application_model.dart';
import 'package:deletedvgtv/pages/ApplicationDetailScreen.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  _ApplicationScreenState createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  late Application application;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.0,
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
        title: Text(
          'Başvurularınız',
          style: TextStyle(
            fontFamily: 'Nunito',
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: FutureBuilder<List<Application>>(
        future: fetchApplication(
          http.Client(),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 60,
                    color: Colors.grey.shade700,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      snapshot.error.toString(),
                      style: TextStyle(fontFamily: 'Nunito'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outlined, size: 70, color: Colors.black45),
                    Text('Şuana kadar hiç başvuru yapmadınız.',
                        style: TextStyle(fontFamily: 'Nunito')),
                  ],
                ),
              );
            }
            return ApplicationItem(data: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ApplicationItem extends StatelessWidget {
  const ApplicationItem({Key? key, required this.data}) : super(key: key);
  final List<Application> data;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return SafeArea(
      child: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 0.5, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin:
                        EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 15, left: 10, right: 10, bottom: 0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child: Container(
                                      child: ImageCached(
                                          width: 70,
                                          height: 70,
                                          url: data[index].companyIcon),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 0.5,
                                            color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(6),
                                      )),
                                ),
                                Container(
                                  width: width * 0.65,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index].advertsTitle,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: 'Nunito'),
                                      ),
                                      Text(
                                        data[index].companyName,
                                        // snapshot!.application[index].companyDesc,
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index].companyDesc.length > 151
                                            ? data[index]
                                                    .companyDesc
                                                    .substring(0, 150) +
                                                '...'
                                            : data[index].companyDesc,
                                        style: TextStyle(
                                            fontSize: 10, fontFamily: 'Nunito'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey.shade200,
                              margin: EdgeInsets.only(top: 10),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.date_range,
                                          size: 16,
                                        ),
                                        Text(
                                          ' ' + data[index].applicationDate,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ApplicationDetailScreen(
                                                      data[index])),
                                        );
                                      },
                                      child: Status(
                                        data[index].status.toString(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              })),
    );
  }
}

class Status extends StatelessWidget {
  final String status;
  Status(this.status);

  @override
  Widget build(BuildContext context) {
    String title = "Başvuru beklemede   ";
    var color = const Color(0xffb74093);
    var icon = const Icon(Icons.ac_unit);

    switch (status) {
      case "1":
        {
          title = "Başvurunuz alındı   ";
          color = const Color(0xffc1def8);
          icon = const Icon(Icons.mark_email_read_outlined, size: 18);
        }
        break;

      case "2":
        {
          title = "İnceleniyor   ";
          color = const Color(0xfffcebba);
          icon = const Icon(Icons.hourglass_bottom_outlined, size: 18);
        }
        break;

      case "3":
        {
          title = "Mülakata bekleniyor   ";
          color = const Color(0xffcee4cb);
          icon = const Icon(Icons.task_alt_outlined, size: 18);
        }
        break;

      case "4":
        {
          title = "Olumsuz Sonuçlandı   ";
          color = const Color(0xfff7c7d3);
          icon = const Icon(Icons.mood_bad_outlined, size: 18);
        }
        break;

      case "5":
        {
          title = "Olumlu Sonuçlandı   ";
          color = const Color(0xff57cc99);
          icon = const Icon(Icons.verified_outlined, size: 18);
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          icon,
          Text(
            title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito'),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.arrow_forward_outlined,
            size: 18,
          )
        ],
      ),
    );
  }
}
