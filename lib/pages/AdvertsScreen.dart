//burası bir sayfa
import 'package:flutter/material.dart';

class AdvertScreen extends StatelessWidget {
  const AdvertScreen({Key? key}) : super(key: key);

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

    final List<String> advertstitleDetails = <String>[
      "GENEL NİTELİKLER VE İŞ TANIMI",
      "İNSANSIZ SUÜSTÜ ARAÇLARI PROTOTİP YARIŞMASI",
      "JOB DESCRIPTION",
      "GENEL NİTELİKLER VE İŞ TANIMI",
      "GENEL NİTELİKLER VE İŞ TANIMI",
    ];

    final List<String> advertsdetails = <String>[
      "Üniversitelerin Bilgisayar Mühendisliği ve benzeri bölümlerinin birinden mezunum, C#, Java, JavaScript dillerinden herhangi birini biliyorum...",
      "Yarışmaya takım adına sadece Takım Lideri başvuruda bulunabilecektir. Yarışmaya takım olarak katılmak zorunludur.  Her takım en az dört (4) en fazla on (10) kişi ve bir (1) danışmandan oluşmalıdır...",
      "Experience in one or more of the following: Wi-Fi, Bluetooth, 2G/3G/4G Cellular systems, GPS, or similar wireless technologies...",
      "Bilgisayar mühendisliğinden lisans (tercihen yüksek lisans) dereceli olmak, Yazılım tasarımı ve geliştirmede +3 yıl deneyim...",
      "Üniversitelerin 2 yıllık bölümlerinden mezun (Mekatronik, Otomotiv, Elektrik-Elektronik),Otomotiv veya iş makinaları satış sonrası hizmetlerde en az 2 yıl tecrübe sahibi...",
    ];

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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            color: Colors.white,
                            width: width * 0.2,
                            height: 80,
                            child: Image.network(imageUri[index]),
                          ),
                          Container(
                            width: width * 0.65,
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  advertstitleDetails[index],
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  height: 5,
                                ),
                                Text(
                                  advertsdetails[index],
                                  style: TextStyle(fontSize: 11),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.blue,
                                    ),
                                    margin: EdgeInsets.only(top: 10),
                                    width: width,
                                    height: 30,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Detaylı İncele",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })));
  }
}
