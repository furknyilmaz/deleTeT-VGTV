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
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: GridView.count(
          addSemanticIndexes: true,
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(data.length, (index) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.6, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network(
                  data[index]['photo'],
                  fit: BoxFit.scaleDown,
                  width: (width / 2) - 25,
                  height: (width / 2) - 25,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
