import 'package:deletedvgtv/pages/Corporate/CompanyCreateInterview.dart';
import 'package:deletedvgtv/utils/requestManeger.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompanyApplicationButton extends StatefulWidget {
  int? appID;
  int? status;
  CompanyApplicationButton(this.appID, this.status);
  @override
  _CompanyApplicationButtonState createState() =>
      _CompanyApplicationButtonState();
}

class _CompanyApplicationButtonState extends State<CompanyApplicationButton> {
  @override
  void initState() {
    super.initState();
    updateApplicationStatus(
      widget.appID,
      widget.status,
      2,
    );
  }

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
          Container(
            child: Text(
              widget.status == 3
                  ? 'Etkin Başvuru Sonucu: Mülakat Oluşturuldu...'
                  : widget.status == 4
                      ? 'Etkin Başvuru Sonucu: Olumsuz Sonuçlandırıldı...'
                      : widget.status == 5
                          ? 'Etkin Başvuru Sonucu: Olumlu sonuçlandırıldı...'
                          : 'Etkin Başvuru Sonucu: İnceleniyor...',
              style: TextStyle(fontFamily: 'Nunito'),
            ),
          ),
          InterviewCreateButton(),
          ApplicationStatusButton(5, widget.appID),
          ApplicationStatusButton(4, widget.appID),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ApplicationStatusButton extends StatelessWidget {
  ApplicationStatusButton(this.status, this.appID);
  final int status;
  int? appID;

  @override
  Widget build(BuildContext context) {
    String title = "Başvuru beklemede   ";
    var color = const Color(0xffb74093);
    var icon = const Icon(Icons.ac_unit);

    switch (status) {
      case 4:
        {
          title = " Olumsuz Sonuçlandır";
          color = const Color(0xfff7c7d3);
          icon = const Icon(Icons.mood_bad_outlined, size: 18);
        }
        break;

      case 5:
        {
          title = " Olumlu Sonuçlandır";
          color = const Color(0xff57cc99);
          icon = const Icon(Icons.verified_outlined, size: 18);
        }
        break;
    }

    return GestureDetector(
      onTap: () {
        updateApplicationStatus(appID, 1, status);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
      ),
    );
  }
}

class InterviewCreateButton extends StatelessWidget {
  const InterviewCreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CreateInterview() //LoginScreenPage(info: ""),
              ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xffcee4cb),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.mood_bad_outlined, size: 18),
            Text(
              " Mülakat Oluştur",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Nunito'),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
