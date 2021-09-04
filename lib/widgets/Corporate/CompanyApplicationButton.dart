import 'package:deletedvgtv/pages/HomepageScreen.dart';
import 'package:flutter/material.dart';

class CompanyApplicationButton extends StatefulWidget {
  const CompanyApplicationButton({Key? key}) : super(key: key);

  @override
  _CompanyApplicationButtonState createState() =>
      _CompanyApplicationButtonState();
}

class _CompanyApplicationButtonState extends State<CompanyApplicationButton> {
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
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Başvuru Sonucu',
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            //
            //
            Container(
              child: Text(
                'Etkin Başvuru Sonucu: İnceleniyor...',
                style: TextStyle(fontFamily: 'Nunito'),
              ),
            ),
            //
            //

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageScreen()),
                );
              },
              child: ApplicationStatusButton('3'),
            ),
            //
            //
            //
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageScreen()),
                );
              },
              child: ApplicationStatusButton('5'),
            ),
            //
            //
            //
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageScreen()),
                );
              },
              child: ApplicationStatusButton('4'),
            ),
          ],
        ));
  }
}

class ApplicationStatusButton extends StatelessWidget {
  final String status;
  ApplicationStatusButton(this.status);

  @override
  Widget build(BuildContext context) {
    String title = "Başvuru beklemede   ";
    var color = const Color(0xffb74093);
    var icon = const Icon(Icons.ac_unit);

    switch (status) {
      case "3":
        {
          title = " Mülakat Oluştur";
          color = const Color(0xffcee4cb);
          icon = const Icon(Icons.task_alt_outlined, size: 18);
        }
        break;

      case "4":
        {
          title = " Olumsuz Sonuçlandır";
          color = const Color(0xfff7c7d3);
          icon = const Icon(Icons.mood_bad_outlined, size: 18);
        }
        break;

      case "5":
        {
          title = " Olumlu Sonuçlandır";
          color = const Color(0xff57cc99);
          icon = const Icon(Icons.verified_outlined, size: 18);
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          icon,
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito'),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
