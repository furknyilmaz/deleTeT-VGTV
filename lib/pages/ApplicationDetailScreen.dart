import 'package:flutter/material.dart';

class ApplicationDetailScreen extends StatelessWidget {
  final String companyName;
  final String imageUri;
  final String applicationDetails;
  final String statusState;
  final String program;

  ApplicationDetailScreen(this.imageUri, this.applicationDetails,
      this.companyName, this.program, this.statusState);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;

    String message = "";
    String messageDescription = "";
    var icon = const Icon(Icons.ac_unit);
    var color = const Color(0xffb74093);

    switch (statusState) {
      case "1":
        {
          message =
              "Başvurunuz alındı. En kısa sürede  başvuru sonucunu buradan ileteceğiz. ";
          icon = const Icon(Icons.mark_email_read_outlined, size: 50);
          color = const Color(0xffc1def8);
          messageDescription =
              // ignore: unnecessary_brace_in_string_interps
              "12 Ocak 2021 tarihinde ${companyName} firmasına ait ${program} pozisyonu için yapmış olduğunuz başvurunuz bize ulaşmıştır. Firma yetkiliremiz en kısa zamanda sizinle iletişime geçecektir.";
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
              "12 Ocak 2021 tarihinde ${companyName} firmasına ait ${program} pozisyonu için yapmış olduğunuz başvurunuz inceleme aşamasındadır. Aranan kriterlere uygun olmanız durumunda firmamız sizinle iletişime geçecektir.";
        }
        break;

      case "3":
        {
          message =
              "Tebrikler! Başvurunuz olumlu sonuçlandı. Mülakata Bekleniyorsunuz";
          icon = const Icon(Icons.task_alt_outlined, size: 50);
          color = const Color(0xffcee4cb);
          messageDescription =
              "Sizi aramızda görmekten mutluyuz. Aşağıda belirtilen tarih ve saatte sizinle kısa bir online görüşme yapmayı çok istiyoruz. Lütfen belirtilen zamandan en az 5 dakika önce burada hazır olunuz. ";
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
        body: Container(
          child: SafeArea(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 130.0,
                        height: 130.0,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(75),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300),
                                image: new DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: new NetworkImage(imageUri)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 5),
                        child: Text(
                          companyName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, left: 20, right: 20, bottom: 25),
                        child: Text(
                          program,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: Text(
                          applicationDetails,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
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
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
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
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                messageDescription,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child:
                            statusState == '3' ? new InterviewButton() : null,
                      )
                    ],
                  ),
                )
              ],
            )),
          ),
        ));
  }
}

class InterviewButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {}, child: Text('Mülakat Ekranına Git'));
  }
}
