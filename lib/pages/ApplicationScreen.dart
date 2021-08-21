import 'package:deletedvgtv/pages/ApplicationDetailScreen.dart';
import 'package:flutter/material.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;

    final List<String> imageUri = <String>[
      "https://vizyonergenc.com/company/crs-soft.png",
      "https://vizyonergenc.com/company/ssb.png",
      "https://vizyonergenc.com/company/pavotek-pavo-tasarim-uretim-elektronik-tic-as.jpeg",
      "https://vizyonergenc.com/company/selvi-technology.png",
      "https://vizyonergenc.com/company/fnss.png",
    ];

    final List<String> companyName = <String>[
      "Yazılım Mühendisi (Tam Zamanlı)",
      "ROBOİK 2021",
      "Rf Hardware Engineer (Tam Zamanlı)",
      "Yazılım Geliştirme Takım Lideri",
      "Ürün Destek Yetkilisi",
    ];

    final List<String> program = <String>[
      "Aday Mühendis Programı",
      "Yazılım Geliştirme Uzmanı",
      "Elektironik ve Haberleşme Uzmanı",
      "Siber Güvenlik Uzmanı",
      "Elektronik Haberleşme Stajyer Programı",
    ];

    final List<String> applicationDetails = <String>[
      "Üniversitelerin Bilgisayar Mühendisliği ve benzeri bölümlerinin birinden mezunum, C#, Java, JavaScript dillerinden herhangi birini biliyorum...",
      "Yarışmaya takım adına sadece Takım Lideri başvuruda bulunabilecektir. Yarışmaya takım olarak katılmak zorunludur.  Her takım en az dört (4) en fazla on (10) kişi ve bir (1) danışmandan oluşmalıdır...",
      "Experience in one or more of the following: Wi-Fi, Bluetooth, 2G/3G/4G Cellular systems, GPS, or similar wireless technologies...",
      "Bilgisayar mühendisliğinden lisans (tercihen yüksek lisans) dereceli olmak, Yazılım tasarımı ve geliştirmede +3 yıl deneyim...",
      "Üniversitelerin 2 yıllık bölümlerinden mezun (Mekatronik, Otomotiv, Elektrik-Elektronik),Otomotiv veya iş makinaları satış sonrası hizmetlerde en az 2 yıl tecrübe sahibi...",
    ];

    final List<String> statusState = <String>["1", "2", "3", "4", "5"];

    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 0.5, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin:
                        EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 15, left: 10, right: 10, bottom: 0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 0.5,
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: new DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: new NetworkImage(
                                                  imageUri[index])))),
                                ),
                                Container(
                                  width: width * 0.65,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        companyName[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: 'Nunito'),
                                      ),
                                      Container(
                                        height: 5,
                                      ),
                                      Text(
                                        applicationDetails[index],
                                        style: TextStyle(
                                            fontSize: 11, fontFamily: 'Nunito'),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.date_range,
                                          size: 16,
                                        ),
                                        Text(
                                          " 16 Ağustos 2021",
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
                                                  ApplicationDetailScreen(
                                                    imageUri[index],
                                                    applicationDetails[index],
                                                    companyName[index],
                                                    program[index],
                                                    statusState[index],
                                                  )),
                                        );
                                      },
                                      child: Status(statusState[index]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  );
                })));
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
          title = "Başvurunuz alındı   ";
          color = const Color(0xffc1def8);
          icon = const Icon(Icons.mark_email_read_outlined, size: 18);
        }
        break;

      case "2":
        {
          title = "İnceleniyor   ";
          color = const Color(0xfffcebba);
          icon = const Icon(Icons.hourglass_bottom_outlined, size: 18);
        }
        break;

      case "3":
        {
          title = "Mülakata bekleniyor   ";
          color = const Color(0xffcee4cb);
          icon = const Icon(Icons.task_alt_outlined, size: 18);
        }
        break;

      case "4":
        {
          title = "Olumsuz Sonuçlandı   ";
          color = const Color(0xfff7c7d3);
          icon = const Icon(Icons.mood_bad_outlined, size: 18);
        }
        break;

      case "5":
        {
          title = "Olumlu Sonuçlandı   ";
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
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito'),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.arrow_forward_outlined,
            size: 18,
          )
        ],
      ),
    );
  }
}
