import 'package:flutter/material.dart';
import 'AdvertsDetailScreen.dart';

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
      "Hardware Engineer (Tam Zamanlı)",
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

    final List<String> advertsDetails = <String>[
      "Üniversitelerin Bilgisayar Mühendisliği ve benzeri bölümlerinin birinden mezunum, C#, Java, JavaScript dillerinden herhangi birini biliyorum...",
      "Yarışmaya takım adına sadece Takım Lideri başvuruda bulunabilecektir. Yarışmaya takım olarak katılmak zorunludur.  Her takım en az dört (4)...",
      "Experience in one or more of the following: Wi-Fi, Bluetooth, 2G/3G/4G Cellular systems, GPS, or similar wireless technologies...",
      "Bilgisayar mühendisliğinden lisans (tercihen yüksek lisans) dereceli olmak, Yazılım tasarımı ve geliştirmede +3 yıl deneyim...",
      "Üniversitelerin 2 yıllık bölümlerinden mezun (Mekatronik, Otomotiv, Elektrik-Elektronik),Otomotiv veya iş makinaları satış sonrası...",
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(0.0),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(top: 3, left: 8, right: 8, bottom: 3),
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdvertsDetailScreen(
                              imageUri[index],
                              advertsDetails[index],
                              companyName[index],
                              advertstitleDetails[index],
                            )),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                                  fontSize: 16,
                                  fontFamily: 'Nunito'),
                            ),
                            Container(
                              height: 5,
                            ),
                            Text(
                              advertstitleDetails[index],
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito'),
                            ),
                            Container(
                              height: 5,
                            ),
                            Text(
                              advertsDetails[index],
                              style:
                                  TextStyle(fontSize: 11, fontFamily: 'Nunito'),
                            ),
                            //Button
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ActiveButton extends StatefulWidget {
  const ActiveButton({Key? key}) : super(key: key);

  @override
  _ActiveButtonState createState() => _ActiveButtonState();
}

class _ActiveButtonState extends State<ActiveButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
/*
GestureDetector(
  child: Container(
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
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
          "Başvur",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Nunito'),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              AdvertsDetailScreen(
                imageUri[index],
                advertsDetails[index],
                companyName[index],
                advertstitleDetails[index],
              )),
    );
  },
),
*/