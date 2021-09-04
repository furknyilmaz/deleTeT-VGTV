import 'package:deletedvgtv/pages/broadcast_page.dart';
import 'package:deletedvgtv/services/interview_realtime_services.dart';
import 'package:deletedvgtv/widgets/InterviewTimer.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class InterviewButton extends StatefulWidget {
  final String channelName;
  final int time;
  final int interId;
  final int applicantId;

  InterviewButton({
    required this.channelName,
    required this.time,
    required this.interId,
    required this.applicantId,
  });

  @override
  _InterviewButtonState createState() => _InterviewButtonState();
}

class _InterviewButtonState extends State<InterviewButton> {
  final status = InverviewRealTime.status;
  late String message =
      "Firma mülakat yayınını açtığında burada \"Mülakata Katıl\" butonu görünecektir. Bu butona tıklayarak görüntülü ve sesli görüşmeye katılabilirsiniz.";
  @override
  Widget build(BuildContext context) {
    Future<void> onJoin({required bool isBroadcaster}) async {
      await [Permission.camera, Permission.microphone].request();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BroadcastPage(
            channelName: widget.channelName,
            isBroadcaster: isBroadcaster,
          ),
        ),
      );
    }

    return Container(
      child: StreamBuilder<String>(
        stream: InverviewRealTime.getInterview(
          widget.interId,
          widget.applicantId,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Mülakat zamanı kontrol ediliyor. Lütfen bekleyin.',
                      style:
                          TextStyle(fontFamily: 'Nunito', color: Colors.black),
                    ),
                  )
                ],
              ));
            default:
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Bağlantı kurulurken hata oluştu',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Nunito',
                  ),
                ));
              } else {
                final status = snapshot.data!;

                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        status == '100'
                            ? Column(
                                children: [
                                  Text(
                                    'Firma temsilcisi şuan mülakatta',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        color: Colors.black),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () =>
                                        onJoin(isBroadcaster: true),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 40),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.live_tv,
                                            size: 20,
                                          ),
                                          Text(
                                            '  Mülakata Katıl  ',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Nunito'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      padding: EdgeInsets.all(0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Mülakatın başlaması için kalan zaman',
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                color: Colors.black,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InterviewTimer(time: widget.time),
                                    /* 
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        message,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Nunito',
                                        ),
                                      ),
                                    ),
                                    */
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
