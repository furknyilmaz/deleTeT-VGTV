import 'package:deletedvgtv/models/application_model.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';

class ApplicationDetailScreen extends StatelessWidget {
  final Application application;

  ApplicationDetailScreen(this.application);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    var icon = const Icon(Icons.ac_unit);
    var color = const Color(0xffb74093);
    String message = "";
    String messageDescription = "";

    switch (application.status.toString()) {
      case "1":
        {
          message =
              "Başvurunuz alındı. En kısa sürede  başvuru sonucunu buradan ileteceğiz. ";
          icon = const Icon(Icons.mark_email_read_outlined, size: 50);
          color = const Color(0xffc1def8);
          messageDescription =
              // ignore: unnecessary_brace_in_string_interps
              "12 Ocak 2021 tarihinde ${application.companyName} firmasına ait ${application.advertsTitle} pozisyonu için yapmış olduğunuz başvurunuz bize ulaşmıştır. Firma yetkililerimiz en kısa zamanda sizinle iletişime geçecektir.";
        }
        break;

      case "2":
        {
          message =
              "Başvurunuz inceleme aşamasında. Sonuçlanmasına çok az kaldı.";
          icon = const Icon(Icons.hourglass_bottom_outlined, size: 50);
          color = const Color(0xfffcebba);
          messageDescription =
              // ignore: unnecessary_brace_in_string_interps
              "12 Ocak 2021 tarihinde ${application.companyName} firmasına ait ${application.advertsTitle} pozisyonu için yapmış olduğunuz başvurunuz inceleme aşamasındadır. Aranan kriterlere uygun olmanız durumunda firmamız sizinle iletişime geçecektir.";
        }
        break;

      case "3":
        {
          message =
              "Tebrikler! Başvurunuz olumlu sonuçlandı. Online Mülakata Bekleniyorsunuz";
          icon = const Icon(Icons.task_alt_outlined, size: 50);
          color = const Color(0xffcee4cb);
          messageDescription =
              "Sizi aramızda görmekten mutluyuz. Aşağıda belirtilen tarih ve saatte sizinle kısa bir online görüşme yapmayı çok istiyoruz. Lütfen belirtilen zamandan en az 5 dakika önce Mülakatlarım sayfasında ya da burada hazır olunuz. ";
        }
        break;

      case "4":
        {
          message = "Başvuru Olumsuz Sonuçlandı ";
          icon = const Icon(Icons.mood_bad_outlined, size: 50);
          color = const Color(0xfff7c7d3);
          messageDescription =
              "Ne yazık ki bu pozisyon için belirtilen kriterleyi sağlamıyorsunuz. Daha sonra tekrar görüşmek dileğiyle. Diğer ilanlarımıza göz atmayı unutmayın! ";
        }
        break;

      case "5":
        {
          message = "Başvurunuz Olumlu Sonuçlandı ";
          icon = const Icon(Icons.verified_outlined, size: 50);
          color = const Color(0xff57cc99);
          messageDescription =
              "Tebrikler! Artık ekibimizin bir parçası oldunuz.İşe alım işlemleriniz başlatıldı. En kısa zamanda sizleri ofisimize bekliyoruz. ";
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(69, 123, 157, 1),
          title: Text('Başvuru Bilgileri'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: SafeArea(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              width: 150,
                              height: 150,
                              margin: EdgeInsets.all(0),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Container(
                                  child: ImageCached(
                                      url: application.companyIcon)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 2),
                            child: Text(
                              application.companyName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Nunito',
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 20, right: 20, bottom: 15),
                            child: Text(
                              application.advertsTitle,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 20, right: 20, bottom: 15),
                            child: Text(
                              application.advertsDescription,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border:
                          Border.all(width: 0.4, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_city, size: 16),
                            Text(
                              ' ' +
                                  application.companyLocation.substring(0, 10),
                              style:
                                  TextStyle(fontFamily: 'Nunito', fontSize: 12),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.date_range_outlined, size: 16),
                            Text(
                              ' ' + application.applicationDate,
                              style:
                                  TextStyle(fontFamily: 'Nunito', fontSize: 12),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.timelapse, size: 16),
                            Text(
                              ' ' + application.wayOfWorking,
                              style:
                                  TextStyle(fontFamily: 'Nunito', fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(right: 15, left: 15, top: 15),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: icon,
                              ),
                              Text(
                                message,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito',
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  messageDescription,
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: application.status == 3
                              ? new InterviewButton()
                              : Container(
                                  height: 30,
                                ),
                        )
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
  }
}

class InterviewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(width: 0.4, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 120,
                height: 130,
                child: Image.network(
                    'https://lh3.googleusercontent.com/proxy/jxfzSTvxwpJ2fAgXy80JBEHa6y9bTxwd-Z4VIr3cIyd-bkA9iJ9P781ZNKQccOay6l9LT20P1BpHahx59Qfj3D4-yz7RPzKEPd6D'),
              ),
              Container(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mülakat Zamanı',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                        fontSize: 16),
                  ),
                  Text('18 Eylül 2021 09:30',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Nunito',
                          fontSize: 15)),
                  Text(
                    'Departman: İnsan Kaynakları',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito',
                        fontSize: 16),
                  ),
                  ElevatedButton(
                    onLongPress: () {},
                    onPressed: () {},
                    child: Text(
                      "Detaylar",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

/* 
 child: Text(day.toString() +
              ' Gün ' +
              time.toString() +
              ' saat sonra katılabilirisiniz'),
*/