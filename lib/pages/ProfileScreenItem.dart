import 'package:deletedvgtv/models/profile_modal.dart';
import 'package:deletedvgtv/services/api_services.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenItem extends StatefulWidget {
  String? data;
  ProfileScreenItem();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

String? id = '89';
var data = [];

class _ProfileScreenState extends State<ProfileScreenItem> {
  @override
  void initState() {
    super.initState();
    print("id:" + id.toString());
    control().then((value) => id = value);
    fetchCProfile(
      http.Client(),
    ).then((value) => data = value);
    print("dddd" + data.toString());
  }

  Future<String> control() async {
    var sp = await SharedPreferences.getInstance();
    String? username = sp.getString("user_id");
    if (username != null) {
      print(username);
      return username;
    } else {
      return 'false';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(5),
                    width: 140,
                    height: 180,
                    child: ImageCached(
                        url:
                            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(26),
                    child: Icon(Icons.change_circle_outlined, size: 22),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "d",
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'sdd',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.link_outlined, size: 14),
                            Text(
                              '19 Ba??lant??',
                              style: TextStyle(fontFamily: 'Nunito'),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.people_alt_outlined, size: 14),
                            Text(
                              ' 120 Arkada??',
                              style: TextStyle(fontFamily: 'Nunito'),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.person_add_alt_outlined, size: 14),
                            Text(
                              ' 45 Takip',
                              style: TextStyle(fontFamily: 'Nunito'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star_half,
                        size: 20,
                        color: Colors.amber,
                      ),
                      Icon(Icons.star_border_rounded,
                          size: 20, color: Colors.amber),
                    ],
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 20, left: 25),
            child: Stack(
              children: [
                LinearPercentIndicator(
                  width: width * 0.83,
                  lineHeight: 28.0,
                  percent: 0.63,
                  backgroundColor: Colors.grey.shade300,
                  progressColor: Colors.amber,
                ),
                Container(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Profil Tamamlama: %63 ',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hakk??nda',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'Gates, Microsoft ??irketinin kurucular??ndand??r ve ??u anda ??irketin teknik dan????manl??????n?? yapmaktad??r. Mart 2020de, hay??r i??lerine daha ??ok zaman ay??rmak istedi??i i??in Microsoftun ba??kanl??????ndan istifa etmi??tir.Gatese, hayat??n??n en k??t?? g??n?? soruldu??unda Annemin ??ld?????? g??n diyerek cevap vermi??tir.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                ),
                CvFile(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 45,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.school_outlined, size: 22),
                            Text(
                              '  E??itim Bilgileri',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        UniverstyInfoModal(),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.apartment_outlined,
                              size: 18,
                              color: Colors.grey.shade700,
                            ),
                            Text(
                              ' Marmara ??niversitesi (2013-2017) ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '       Lisans - Bilgisayar M??hendisli??i ',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  width: width,
                ),
                Container(height: 10),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.apartment_outlined,
                              size: 18,
                              color: Colors.grey.shade700,
                            ),
                            Text(
                              ' Hacettepe ??niversitesi (2017-2021) ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '       Y??ksek Lisans - Bilgisayar M??hendisli??i ',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  width: width,
                ),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 45,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.work_outline_outlined, size: 22),
                            Text(
                              ' Deneyimler',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        ExperienceModal(),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.business_outlined,
                              size: 18,
                              color: Colors.grey.shade700,
                            ),
                            Text(
                              ' Aselsan (2017)',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '        Stajyer ',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  width: width,
                ),
                SizedBox(height: 10),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.business_outlined,
                              size: 18,
                              color: Colors.grey.shade700,
                            ),
                            Text(
                              ' T??rk Havac??l??k ve Uzay Sanayi (2018 - Halen)',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '        Yaz??l??m Geli??time Uzman?? ',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  width: width,
                ),
                Container(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 45,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.add_ic_call_outlined, size: 22),
                            Text(
                              '  ??leti??im Bilgileri',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        ContactModal(),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 18),
                            Container(
                              padding: EdgeInsets.only(left: 3),
                              width: width * 0.75,
                              child: Text(
                                'Nam??k Kemal Mahallesi, 2023.Sokak, S??????t Apartman??, Kat:5, No:10, Bah??elievler/ANKARA',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Nunito'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  width: width,
                ),
                Container(height: 10),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.language_outlined, size: 18),
                            Container(
                              padding: EdgeInsets.only(left: 3),
                              width: width * 0.75,
                              child: Text(
                                " www.barisgungoren.com.tr",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Nunito'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  width: width,
                ),
                Container(height: 10),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.phone_iphone_outlined, size: 18),
                            Container(
                              padding: EdgeInsets.only(left: 3),
                              width: width * 0.75,
                              child: Text(
                                " 0541 504 7890",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Nunito'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  width: width,
                ),
                Container(height: 10),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.email_outlined, size: 18),
                            Container(
                              padding: EdgeInsets.only(left: 3),
                              width: width * 0.75,
                              child: Text(
                                " barisgungoren@gmail.com",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Nunito'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  width: width,
                ),
                Container(height: 20)
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class CvFile extends StatelessWidget {
  const CvFile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('??zge??mi??'),
          content: const Text(
            'Kullan??c??n??n ??zge??mi??i bu alanda  g??sterilecektir.',
            style: TextStyle(fontFamily: 'Nunito'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Tamam'),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.6, color: Colors.amber),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                width: width * 0.8,
                height: 40,
                child: Center(
                  child: Text(
                    '??zge??mi??i G??r??nt??le',
                    style: TextStyle(fontFamily: 'Nunito', color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UniverstyInfoModal extends StatelessWidget {
  const UniverstyInfoModal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('??niversite Ekle'),
          content: const Text(
            'Version 2.0',
            style: TextStyle(fontFamily: 'Nunito'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Tamam'),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Icon(Icons.add_circle_outline_outlined),
      ),
    );
  }
}

class ExperienceModal extends StatelessWidget {
  const ExperienceModal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Deneyim Ekle'),
          content: const Text(
            'Version 2.0',
            style: TextStyle(fontFamily: 'Nunito'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Tamam'),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Icon(Icons.add_circle_outline_outlined),
      ),
    );
  }
}

class ContactModal extends StatelessWidget {
  const ContactModal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('??leti??im Bilgisi Ekle'),
          content: const Text(
            'Version 2.0',
            style: TextStyle(fontFamily: 'Nunito'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Tamam'),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Icon(Icons.add_circle_outline_outlined),
      ),
    );
  }
}
