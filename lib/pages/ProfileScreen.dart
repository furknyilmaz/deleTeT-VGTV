import 'dart:async';
import 'dart:convert';
import 'package:deletedvgtv/models/profile_modal.dart';
import 'package:deletedvgtv/pages/ProfileScreenItem.dart';
import 'package:deletedvgtv/utils/constants.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Profile> fetchProfile() async {
  var sp = await SharedPreferences.getInstance();
  String? userID = sp.getString("user_id");
  final response = await http.get(Uri.parse('${profileAPI + userID!}'));
  if (response.statusCode == 200) {
    final jsonresponse = json.decode(utf8.decode(response.bodyBytes));
    return Profile.fromJson(jsonresponse[0]);
  } else {
    throw Exception(
        'Kullanıcı verilerilerine erişirken bir hata meydana geldi');
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  late Future<Profile> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Scaffold(
      body: Center(
        child: FutureBuilder<Profile>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.all(5),
                              width: 140,
                              height: 180,
                              child: ImageCached(url: snapshot.data!.imageUrl),
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
                              child:
                                  Icon(Icons.change_circle_outlined, size: 22),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.fullName,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              snapshot.data!.experiences,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.link_outlined, size: 14),
                                      Text(
                                        '19 Bağlantı',
                                        style: TextStyle(fontFamily: 'Nunito'),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.people_alt_outlined, size: 14),
                                      Text(
                                        ' 120 Arkadaş',
                                        style: TextStyle(fontFamily: 'Nunito'),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.person_add_alt_outlined,
                                          size: 14),
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
                      padding:
                          const EdgeInsets.only(top: 0, bottom: 20, left: 25),
                      child: Stack(
                        children: [
                          LinearPercentIndicator(
                            width: width * 0.83,
                            lineHeight: 28.0,
                            percent:
                                snapshot.data!.profilePoints.toDouble() / 100,
                            backgroundColor: Colors.grey.shade300,
                            progressColor: Colors.amber,
                          ),
                          Container(
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Profil Tamamlama: % ${snapshot.data!.profilePoints}',
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hakkında',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            snapshot.data!.about,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.school_outlined, size: 22),
                                      Text(
                                        '  Eğitim Bilgileri',
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
                                        ' Marmara Üniversitesi (2013-2017) ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '       Lisans - Bilgisayar Mühendisliği ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
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
                                        ' Hacettepe Üniversitesi (2017-2021) ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '       Yüksek Lisans - Bilgisayar Mühendisliği ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.work_outline_outlined,
                                          size: 22),
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
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '        Stajyer ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
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
                                        ' Türk Havacılık ve Uzay Sanayi (2018 - Halen)',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '        Yazılım Geliştime Uzmanı ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.add_ic_call_outlined,
                                          size: 22),
                                      Text(
                                        '  İletişim Bilgileri',
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
                                      Icon(Icons.location_on_outlined,
                                          size: 18),
                                      Container(
                                        padding: EdgeInsets.only(left: 3),
                                        width: width * 0.75,
                                        child: Text(
                                          'Namık Kemal Mahallesi, 2023.Sokak, Söğüt Apartmanı, Kat:5, No:10, Bahçelievler/ANKARA',
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
                                          snapshot.data!.website,
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
                                      Icon(Icons.phone_iphone_outlined,
                                          size: 18),
                                      Container(
                                        padding: EdgeInsets.only(left: 3),
                                        width: width * 0.75,
                                        child: Text(
                                          snapshot.data!.phoneNumber,
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
                                          snapshot.data!.email,
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
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text(snapshot.error.toString());
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
