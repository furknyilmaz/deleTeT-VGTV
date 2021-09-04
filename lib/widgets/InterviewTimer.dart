import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class InterviewTimer extends StatefulWidget {
  final int time;
  final String? message;

  InterviewTimer({required this.time, this.message});

  @override
  _InterviewTimerState createState() => _InterviewTimerState();
}

String? inputStatu = "online";

class _InterviewTimerState extends State<InterviewTimer> {
  @override
  void initState() {
    super.initState();
    if (widget.time < 0) {
      if (widget.time < 100000) {
        inputStatu = "timeout";
      } else {
        inputStatu = "companyWait";
      }

      print(widget.time);
    } else {
      inputStatu = 'dateWait';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          inputStatu == 'dateWait'
              ? SlideCountdown(
                  decoration: BoxDecoration(),
                  textStyle: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                      fontSize: 18),
                  duration: Duration(microseconds: widget.time),
                  durationTitle: DurationTitle.tr(),
                  slideDirection: SlideDirection.up,
                  separatorType: SeparatorType.title,
                  onDone: () {
                    setState(() {
                      inputStatu = 'companyWait';
                    });
                  },
                )
              : inputStatu == 'companyWait'
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Mülakat zamanı geldi \n Firmanın oturumu başlatması bekleniyor.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Mülakat saati geçti',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
        ],
      ),
    );
  }
}
