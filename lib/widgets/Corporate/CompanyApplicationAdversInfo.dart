import 'package:flutter/material.dart';

class CompanyApplicationAdvertsInfo extends StatefulWidget {
  const CompanyApplicationAdvertsInfo({Key? key}) : super(key: key);

  @override
  _CompanyApplicationAdvertsInfoState createState() =>
      _CompanyApplicationAdvertsInfoState();
}

class _CompanyApplicationAdvertsInfoState
    extends State<CompanyApplicationAdvertsInfo> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.6, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.only(top: 0, left: 10, right: 10),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      width: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
            child: Text(
              "İlan Bilgileri",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.business_outlined,
                    size: 18,
                  ),
                ),
                Text(
                  'Savunma Teknolojileri Mühensilik ve Ticaret A:Ş',
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
              ],
            ),
          ),
          //
          //
          //
          //
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.work_outline_outlined,
                    size: 18,
                  ),
                ),
                Text(
                  'Uzman Gönüllü Yazılım Mühendisliği',
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
              ],
            ),
          ),
          //
          //

          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.access_time_outlined,
                    size: 18,
                  ),
                ),
                Text(
                  'Tam Zamanlı',
                  style: TextStyle(fontFamily: 'Nunito'),
                ),
              ],
            ),
          ),
          //
          //

          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Icon(
                    Icons.place_outlined,
                    size: 18,
                  ),
                ),
                Container(
                  width: width - 100,
                  child: Text(
                    "Mühendislik ve Tic. A.Ş. Mustafa Kemal Mahallesi 2151.Cadde No:3/A Çankaya-ANKARA",
                    style: TextStyle(fontFamily: 'Nunito'),
                  ),
                ),
              ],
            ),
          ),
          //
          //
        ],
      ),
    );
  }
}
