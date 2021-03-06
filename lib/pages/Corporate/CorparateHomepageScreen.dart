import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/pages/Corporate/CompanyApplication.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CorparateHomepageScreen extends StatefulWidget {
  const CorparateHomepageScreen({Key? key}) : super(key: key);

  @override
  _CorparateHomepageScreenState createState() =>
      _CorparateHomepageScreenState();
}

class _CorparateHomepageScreenState extends State<CorparateHomepageScreen> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
          child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(flex: 10, child: CompanyInfoWidget()),
            Expanded(
              flex: 30,
              child: FutureBuilder<List<Advers>>(
                future: fetchCompanyAdverts(
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
                            Icon(Icons.info_outlined,
                                size: 70, color: Colors.black45),
                            Text('Şuana kadar hiç başvuru yapmadınız.',
                                style: TextStyle(fontFamily: 'Nunito')),
                          ],
                        ),
                      );
                    }
                    return AdvertsInfo(data: snapshot.data!);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class CompanyInfoWidget extends StatelessWidget {
  const CompanyInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/vg.png",
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Vizyoner Genç',
              style: TextStyle(fontFamily: 'Nunito', fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

class AdvertsInfo extends StatelessWidget {
  const AdvertsInfo({Key? key, required this.data}) : super(key: key);
  final List<Advers> data;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'İlanlar',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Tümünü Gör',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 200,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CompanyApplications(data[index].id),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.5, color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.symmetric(vertical: 2),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].advertsTitle,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                            Container(height: 3),
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range_outlined,
                                  size: 16,
                                ),
                                Text(
                                  ' ' + data[index].advertsDate,
                                  style: TextStyle(fontFamily: 'Nunito'),
                                ),
                              ],
                            ),
                            Container(height: 3),
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse_outlined,
                                  size: 16,
                                ),
                                Text(
                                  ' ' + data[index].wayOfWorking,
                                  style: TextStyle(fontFamily: 'Nunito'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.network(
                          data[index].companyIcon,
                          width: 60,
                          height: 60,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/* 
Container(
      width: width,
      color: Colors.amber,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          /////////////////// Başlık ve Tümünü Gör ////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'İlanlarınız',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Tümünü Gör',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          //////////////////İçerik //////////////////////////
          Row(
            children: [
              Container(
                width: 120,
                height: 120,
                color: Colors.red,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Center(child: Text('İlanlar')),
              )
            ],
          )
        ],
      ),
    );
*/