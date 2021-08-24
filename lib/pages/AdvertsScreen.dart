import 'package:deletedvgtv/models/advers_modal.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:deletedvgtv/widgets/AdvertsItem.dart';
import 'package:flutter/material.dart';

class AdvertScreen extends StatelessWidget {
  const AdvertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: FutureBuilder(
        future: getAdvers(adversAPI),
        builder: (context, AsyncSnapshot<Advers> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            debugPrint(snapshot.data!.advers[0].adversAbout);
            return AdvertsItem(snapshot.data);
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
