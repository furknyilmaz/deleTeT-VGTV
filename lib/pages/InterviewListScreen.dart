import 'dart:convert';
import 'package:deletedvgtv/models/company_model.dart';
import 'package:deletedvgtv/pages/HomepageScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InretviewListScreen extends StatefulWidget {
  const InretviewListScreen({Key? key}) : super(key: key);

  @override
  _InretviewListScreenState createState() => _InretviewListScreenState();
}

class _InretviewListScreenState extends State<InretviewListScreen> {
  late Company company;
  var url = Uri.parse('https://bahadirtiras.com.tr/api/company.json');

  Future<Company> getCompany() async {
    var apiUrl = await http.get(url);
    var response = json.decode(apiUrl.body);
    var data = Company.fromJson(response);
    print(data.toString());
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
        title: Text(
          "Mülakatlarınız",
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
      body: FutureBuilder(
        future: getCompany(),
        builder: (context, AsyncSnapshot<Company> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            debugPrint(snapshot.data!.company[0].title);
            return Center(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.5, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageScreen()),
                            );
                          },
                          child: Column(
                            children: [
                              Image.network(
                                snapshot.data!.company[index].imageUri,
                                fit: BoxFit.scaleDown,
                                width: (width / 2) - 30,
                                height: (width / 2) - 40,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "12 Ocak 2021 09:50 - İnsan Kaynakları",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Nunito'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      childCount: snapshot.data!.company.length,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        },
      ),
    );
  }
}
