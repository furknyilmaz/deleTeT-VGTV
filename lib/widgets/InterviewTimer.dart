import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

class InterviewTimer extends StatefulWidget {
  final int time;
  final String? message;

  InterviewTimer({required this.time, this.message});

  @override
  _InterviewTimerState createState() => _InterviewTimerState();
}

bool inputStatu = true;

class _InterviewTimerState extends State<InterviewTimer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.time < 0) {
      inputStatu = false;
      print(widget.time);
    } else {
      inputStatu = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          inputStatu
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
                      inputStatu = false;
                    });
                  },
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Lütfen birkaç dakika daha bekleyin',
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
