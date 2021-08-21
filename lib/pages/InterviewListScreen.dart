import 'dart:convert';
import 'package:deletedvgtv/pages/HomepageScreen.dart';
import 'package:deletedvgtv/pages/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var data = [];

class InterviewListScreen extends StatefulWidget {
  const InterviewListScreen({Key? key}) : super(key: key);

  @override
  _InterviewListScreen createState() => _InterviewListScreen();
}

class _InterviewListScreen extends State<InterviewListScreen> {
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
      appBar: AppBar(
        title: Text('Mülakatlarınız', style: TextStyle(fontFamily: 'Nunito')),
        backgroundColor: Color.fromRGBO(69, 123, 157, 1),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePageScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.network(
                        data[index]['photo'],
                        fit: BoxFit.scaleDown,
                        width: (width / 2) - 30,
                        height: (width / 2) - 40,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceholderType extends StatelessWidget {
  const PlaceholderType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
          "https://scontent.fesb5-1.fna.fbcdn.net/v/t1.6435-9/70587633_921759381531292_1616702711862919168_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=973b4a&_nc_ohc=Kb0dID4PCq8AX9uff9_&_nc_ht=scontent.fesb5-1.fna&oh=de1a485f1aeac7a434f30aea3d0bdaf0&oe=61481118",
          fit: BoxFit.cover),
    );
  }
}
