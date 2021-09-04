import 'package:deletedvgtv/pages/ProfileScreenItem.dart';
import 'package:flutter/material.dart';

class CompanyApplicationUserProfile extends StatefulWidget {
  const CompanyApplicationUserProfile({Key? key}) : super(key: key);

  @override
  _CompanyApplicationUserProfileState createState() =>
      _CompanyApplicationUserProfileState();
}

class _CompanyApplicationUserProfileState
    extends State<CompanyApplicationUserProfile> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.6, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(5),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            child: Image.network('https://vizyonergenc.com/users/default.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              'Barış Güngören',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'Software Developer',
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(height: 0.5, color: Colors.grey.shade300),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hakkında",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                  ),
                  Text(
                    "Hakkımda çok fazla bilgi yok, beni bilen bilir. saç çalarım, şarkı söylerim. İyi para verirlerse konsere çıkarım. Öyle işte yaşıyoruz bu hayatı yaşayabildiğimiz kadar. başlasa bir şey yok hacı",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400),
                  ),
                  CvFile(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 8.0),
                          child: Text(
                            'Kişisel Bilgiler',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        //
                        //
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'TC Kimlik No: ' + '25085696146',
                            style: TextStyle(fontFamily: 'Nunito'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Adres: ' + 'Mamak/ Ankara',
                            style: TextStyle(fontFamily: 'Nunito'),
                          ),
                        ),
                        //
                        //
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Email: ' + 'bahadirtiras@gmail.com',
                            style: TextStyle(fontFamily: 'Nunito'),
                          ),
                        ),
                        //
                        //
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Telefon Numarası: ' + '0541 504 78 62',
                            style: TextStyle(fontFamily: 'Nunito'),
                          ),
                        ),
                        //
                        //
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Websitesi: ' + 'www.bahadirtiras.com.tr',
                            style: TextStyle(fontFamily: 'Nunito'),
                          ),
                        ),
                        //
                        //
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Üniversite: ' + 'Marmara Üniversitesi',
                            style: TextStyle(fontFamily: 'Nunito'),
                          ),
                        ),
                        //

                        //
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
