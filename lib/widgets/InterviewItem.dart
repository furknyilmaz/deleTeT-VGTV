import 'package:deletedvgtv/models/interview_model.dart';
import 'package:deletedvgtv/pages/InterviewScreen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InterviewItem extends StatelessWidget {
  Interview? snapshot;

  @override
  InterviewItem(this.snapshot);

  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return Center(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 0.5, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InterviewScreen()),
                          );
                        },
                        child: Column(
                          children: [
                            Image.network(
                              snapshot!.interview[index].companyImage,
                              fit: BoxFit.scaleDown,
                              width: (width / 2) - 30,
                              height: (width / 2) - 40,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot!.interview[index].companyDate +
                                        ' - ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Nunito'),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    snapshot!.interview[index].department,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Nunito'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                childCount: snapshot!.interview.length),
          ),
        ],
      ),
    );
  }
}
