import 'package:deletedvgtv/pages/ApplicationDetailScreen.dart';
import 'package:flutter/material.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;

    final List<String> imageUri = <String>[
      "https://vizyonergenc.com/company/aselsan.png",
      "https://vizyonergenc.com/company/akgun.png",
      "https://vizyonergenc.com/company/icc-dijital-endustriyel-teknolojiler-ltd-sti.png",
      "https://vizyonergenc.com/company/intelprobe-savunma-teknolojileri-as.jpeg",
      "https://vizyonergenc.com/company/yonga-teknoloji-mikroelektronik-arge.jpeg",
    ];

    final List<String> companyName = <String>[
      "Aday Mühendis Programı",
      "Yazılım Geliştirme Uzmanı",
      "Elektironik ve Haberleşme Uzmanı",
      "Siber Güvenlik Uzmanı",
      "Elektronik Haberleşme Stajyer Programı",
    ];

    final List<String> applicationDetails = <String>[
      "Türk Silahlı Kuvvetleri'nin haberleşme ihtiyaçlarının milli imkanlarla karşılanması için 1975 yılında kurulan ASELSAN; Türk Silahlı Kuvvetlerini Güçlendirme Vakfı'na (TSKGV) bağlı bir anonim şirkettir. ",
      "AKGÜN Yazılım, 1986’dan bu güne kadar kendi iç kaynakları ile geliştirdiği %100 yerli üretim olan ürünleri ve sağlık sektöründe %20'lik pazar payı ile sektöre yön vermektedir. ",
      "ICC endüstriyel uygulamalar için gereken Endüstriyel Bilgisayar Endüstriyel Haberleşme Ürünleri​ ve Scada Yazılımları ürünlerini satışı yapmaktadır.",
      "InterProbe, 'Yeni Nesil Savunma Teknolojileri', 'Siber Tehdit İstihbaratı' ve 'Siber Güvenlik' çözümlerinde uzmanlaşmış bir Türk şirketidir. InterProbe, yüksek teknolojiye dayalı...",
      "Yonga Teknoloji Mikroelektronik ArGe, ASIC (Uygulamaya Yönelik Tümdevre)/FPGA (Programlanabilir Kapı Dizisi) ve SoC (Yonga Üzeri Sistem) tasarımı ve doğrulaması "
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
                    margin:
                        EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 0),
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.more_horiz_outlined,
                                  size: 24,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                            fontSize: 18),
                                      ),
                                      Container(
                                        height: 5,
                                      ),
                                      Text(
                                        applicationDetails[index],
                                        style: TextStyle(fontSize: 11),
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
                                          "16 Ağustos",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    Status(statusState[index]),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ApplicationDetailScreen(
                                                      imageUri[index],
                                                      applicationDetails[index],
                                                      companyName[index],
                                                      statusState[index],
                                                    )),
                                          );
                                        },
                                        child: Icon(
                                          Icons.arrow_forward_outlined,
                                        )),
                                  ],
                                ),
                              ),
                            )
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
    return Container(
      width: 170,
      child: Text(
        status == "1"
            ? "Başvurunuz alındı..."
            : status == "2"
                ? "İnceleniyor..."
                : status == "3"
                    ? "Mülakata bekleniyor..."
                    : "Olumsuz Sonuçlandı...",
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
      color: status == "1"
          ? Colors.blue[100]
          : status == "2"
              ? Colors.amber[100]
              : status == "3"
                  ? Colors.green[100]
                  : Colors.red[100],
      padding: EdgeInsets.all(12),
    );
  }
}
