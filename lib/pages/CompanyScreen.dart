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
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index % 2 == 0)
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              data[index]['photo'],
                              fit: BoxFit.scaleDown,
                              width: (width / 2) - 35,
                              height: (width / 2) - 60,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(
                              data[index + 1]['photo'],
                              fit: BoxFit.fitWidth,
                              width: (width / 2) - 35,
                              height: (width / 2) - 60,
                            ),
                          ),
                        ],
                      )
                    else
                      SizedBox(
                        height: 0,
                      )
                  ],
                ),
              );
            }));
  }
}
