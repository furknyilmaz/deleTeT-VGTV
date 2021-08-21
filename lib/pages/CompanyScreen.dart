import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var data = [];

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  Future<List<dynamic>> _loadData() async {
    String jsonString = await rootBundle.loadString('lib/models/veri.json');
    return jsonDecode(jsonString).toList();
  }

  @override
  void initState() {
    super.initState();
    _loadData().then(
      (value) => {data = value},
    );
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index % 2 == 0
                        ? Row(
                            children: [
                              Image.network(
                                data[index]['photo'],
                                width: (width / 2) - 40,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.network(
                                data[index + 1]['photo'],
                                width: (width / 2) - 40,
                              ),
                            ],
                          )
                        : SizedBox(
                            height: 1,
                          )
                  ],
                ),
              );
            }));
  }
}
