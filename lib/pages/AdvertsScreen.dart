import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/widgets/AdvertsItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdvertScreen extends StatefulWidget {
  const AdvertScreen({Key? key}) : super(key: key);

  @override
  _AdvertScreenState createState() => _AdvertScreenState();
}

class _AdvertScreenState extends State<AdvertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: FutureBuilder<List<Advers>>(
        future: fetchAdvers(http.Client()),
        builder: (context, snapshot) {
          print(snapshot.error);
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Icon(Icons.dangerous),
                  Text('Bir hata ile karşılaşıldı'),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: AdvertsItem(data: snapshot.data!),
            );
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







/*
GestureDetector(
  child: Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    margin: EdgeInsets.only(top: 10),
    width: width,
    height: 30,
    child: Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      crossAxisAlignment:
          CrossAxisAlignment.center,
      children: [
        Text(
          "Başvur",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Nunito'),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              AdvertsDetailScreen(
                imageUri[index],
                advertsDetails[index],
                companyName[index],
                advertstitleDetails[index],
              )),
    );
  },
),
*/
