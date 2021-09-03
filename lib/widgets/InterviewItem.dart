import 'package:deletedvgtv/models/interview_model.dart';
import 'package:deletedvgtv/pages/InterviewScreen.dart';
import 'package:deletedvgtv/widgets/ImageCached.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InterviewItem extends StatelessWidget {
  const InterviewItem({Key? key, required this.data}) : super(key: key);
  final List<Interview> data;

  @override
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
                                builder: (context) =>
                                    InterviewScreen(data[index])),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: (width / 2) - 30,
                              height: (width / 2) - 40,
                              child: ImageCached(url: data[index].companyIcon),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    data[index].interDate + ' - ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Nunito'),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    data[index].companyDepartment,
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
                childCount: data.length),
          ),
        ],
      ),
    );
  }
}
