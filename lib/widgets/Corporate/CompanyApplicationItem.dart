import 'package:deletedvgtv/models/Corporote/application_company_model.dart';
import 'package:deletedvgtv/pages/Corporate/CompanyApplicationDetailScreen.dart';
import 'package:deletedvgtv/pages/HomepageScreen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompanyApplicationItem extends StatelessWidget {
  const CompanyApplicationItem({Key? key, required this.data, required this.id})
      : super(key: key);
  final List<ApplicationCompany> data;
  final int id;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int stack = 0;
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return SafeArea(
      child: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                if (data[index].advertId.toString() != id.toString()) {
                  if (stack > 0) {
                    return Container();
                  } else {
                    return Container(
                      margin: EdgeInsets.all(20),
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Column(
                          children: [
                            Icon(Icons.info_outlined,
                                size: 40, color: Colors.black45),
                            Text(
                              'Bu ilana hiç başvuru yapılmamış',
                              style:
                                  TextStyle(fontFamily: 'NUnito', fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                } else {
                  stack++;
                  return SingleChildScrollView(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CompanyApplicationDetailScreen(data[index])),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.5, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: EdgeInsets.only(
                            top: 6, left: 8, right: 8, bottom: 0),
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 0.5,
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          image: new DecorationImage(
                                            fit: BoxFit.fitWidth,
                                            image: new NetworkImage(
                                                data[index].applicantImg),
                                          )),
                                      width: 60,
                                      height: 60,
                                    ),
                                    Container(
                                      width: width * 0.65,
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].applicantName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                fontFamily: 'Nunito'),
                                          ),
                                          Text(
                                            data[index].applicantExp,
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            data[index].applicantAbout.length >
                                                    120
                                                ? data[index]
                                                        .applicantAbout
                                                        .substring(0, 120) +
                                                    '...'
                                                : data[index].applicantAbout,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'Nunito'),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey.shade200,
                                  margin: EdgeInsets.only(top: 10),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.date_range,
                                              size: 16,
                                            ),
                                            Text(
                                              ' ' + data[index].applicationDate,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Nunito'),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePageScreen()),
                                            );
                                          },
                                          child: Status(
                                            data[index].status.toString(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                }
              })),
    );
  }
}

class Status extends StatelessWidget {
  final String status;
  Status(this.status);

  @override
  Widget build(BuildContext context) {
    String title = "Başvuru beklemede   ";
    var color = const Color(0xffb74093);
    var icon = const Icon(Icons.ac_unit);

    switch (status) {
      case "1":
        {
          title = " Başvuru Alındı";
          color = const Color(0xffc1def8);
          icon = const Icon(Icons.fact_check_outlined, size: 16);
        }
        break;

      case "2":
        {
          title = "İncelediniz  ";
          color = const Color(0xfffcebba);
          icon = const Icon(Icons.hourglass_bottom_outlined, size: 18);
        }
        break;

      case "3":
        {
          title = "Mülakat oluşturuldu   ";
          color = const Color(0xffcee4cb);
          icon = const Icon(Icons.task_alt_outlined, size: 18);
        }
        break;

      case "4":
        {
          title = "Olumsuz Sonuçlandırdınız   ";
          color = const Color(0xfff7c7d3);
          icon = const Icon(Icons.mood_bad_outlined, size: 18);
        }
        break;

      case "5":
        {
          title = "Olumlu Sonuçlandırdınız  ";
          color = const Color(0xff57cc99);
          icon = const Icon(Icons.verified_outlined, size: 16);
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                fontSize: 11,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito'),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.arrow_forward_outlined,
            size: 16,
          )
        ],
      ),
    );
  }
}
