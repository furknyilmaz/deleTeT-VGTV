import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileScreen extends StatelessWidget {
  final String myTitle;
  final String decr;

  ProfileScreen(this.myTitle, this.decr);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    final double itemWidth = (width / 2) - 25;
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
                    'Barış Göngören',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Bilgisayar Mühendisi',
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
                              ' 19 Bağlantı',
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
                  'Hakkında',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  'Gates, Microsoft şirketinin kurucularındandır ve şu anda şirketin teknik danışmanlığını yapmaktadır. Mart 2020de, hayır işlerine daha çok zaman ayırmak istediği için Microsoftun başkanlığından istifa etmiştir.Gatese, hayatının en kötü günü sorulduğunda Annemin öldüğü gün diyerek cevap vermiştir.',
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
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '       Lisans - Bilgisayar Mühendisliği ',
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
                              ' Hacettepe Üniversitesi (2017-2021) ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '       Yüksek Lisans - Bilgisayar Mühendisliği ',
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
                              ' Türk Havacılık ve Uzay Sanayi (2018 - Halen)',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '        Yazılım Geliştime Uzmanı ',
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
                            Icon(Icons.location_on_outlined, size: 18),
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
          title: const Text('Özgeçmiş'),
          content: const Text(
            'Kullanıcının özgeçmişi bu alanda  gösterilecektir.',
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
                    'Özgeçmişi Görüntüle',
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
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return GestureDetector(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Üniversite Ekle'),
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
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
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
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return GestureDetector(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('İletişim Bilgisi Ekle'),
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
