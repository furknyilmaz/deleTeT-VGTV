import 'package:deletedvgtv/models/profile_modal.dart';
import 'package:deletedvgtv/utils/requestManeger.dart';
import 'package:deletedvgtv/widgets/ProfileScreenItem.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CompanyApplicationUserProfile extends StatefulWidget {
  CompanyApplicationUserProfile(this.id);
  int? id;

  @override
  _CompanyApplicationUserProfileState createState() =>
      _CompanyApplicationUserProfileState();
}

class _CompanyApplicationUserProfileState
    extends State<CompanyApplicationUserProfile> {
  late Future<Profile> profileInfo;

  @override
  void initState() {
    super.initState();
    profileInfo = fetchProfile(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    return FutureBuilder<Profile>(
        future: profileInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.6, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(5),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 0.5, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(50),
                        image: new DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: new NetworkImage(snapshot.data!.imageUrl),
                        )),
                    width: 120,
                    height: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      snapshot.data!.fullName,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      snapshot.data!.experiences,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(height: 0.5, color: Colors.grey.shade300),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hakkında",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                          ),
                          Text(
                            snapshot.data!.about,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w400),
                          ),
                          CvFile(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.0, bottom: 8.0),
                                  child: Text(
                                    'Kişisel Bilgiler',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                //
                                //
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    'TC Kimlik No: ' + snapshot.data!.tckn,
                                    style: TextStyle(fontFamily: 'Nunito'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    'Adres: ' + snapshot.data!.address,
                                    style: TextStyle(fontFamily: 'Nunito'),
                                  ),
                                ),
                                //
                                //
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    'Email: ' + snapshot.data!.email,
                                    style: TextStyle(fontFamily: 'Nunito'),
                                  ),
                                ),
                                //
                                //
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    'Telefon Numarası: ' +
                                        snapshot.data!.phoneNumber,
                                    style: TextStyle(fontFamily: 'Nunito'),
                                  ),
                                ),
                                //
                                //
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    'Websitesi: ' + snapshot.data!.website,
                                    style: TextStyle(fontFamily: 'Nunito'),
                                  ),
                                ),
                                //
                                //
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    'Üniversite: ' + snapshot.data!.university,
                                    style: TextStyle(fontFamily: 'Nunito'),
                                  ),
                                ),
                                //

                                //
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Text(snapshot.error.toString());
          }
          return const CircularProgressIndicator();
        });
  }
}
