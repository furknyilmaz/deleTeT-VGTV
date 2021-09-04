import 'package:deletedvgtv/models/login_model.dart';
import 'package:deletedvgtv/pages/LoginScreen.dart';
import 'package:deletedvgtv/utils/userRegister.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  String? info;
  String? id;
  ProfileInfo({this.info, this.id});
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final scoffoldKey = GlobalKey<ScaffoldState>();
  final programssKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalKeyForm = new GlobalKey<FormState>();
  late ProfileUpdateModal requestModal;

  @override
  void initState() {
    super.initState();
    requestModal = new ProfileUpdateModal();
    requestModal.imageUrl =
        "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
    print("data" + requestModal.toString());
  }

  Future<void> update() async {
    final form = globalKeyForm.currentState;
    if (form!.validate()) {
      form.save();
      profileUpdate(requestModal, context, widget.id);
      print(requestModal);

      final snackBar = SnackBar(
        backgroundColor: Color(0xff38a3a5),
        content: Container(
          height: 100,
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lütfen biraz bekleyin. Bilgiler kaydediliyor',
                  style: TextStyle(fontFamily: 'Nunito', fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      await Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreenPage(
                info: 'Kayıt tamamlandı. Giriş yapabilirsiniz.'),
          ),
        );
      });
    } else {
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text('Lütfen gerekli tüm alanları doldurun!!!'),
        action: SnackBarAction(
          textColor: Color(0xffffffff),
          label: 'Tamam',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scoffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ProfilePhoto(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(width: 1, color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  child: Text(
                    widget.info.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontFamily: 'Nunito'),
                  ),
                ),
                Form(
                  key: globalKeyForm,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: new TextFormField(
                          style: TextStyle(fontSize: 14),
                          validator: (input) => input!.length != 11
                              ? "11 haneli kimlik numarası giriniz"
                              : null,
                          onSaved: (input) => requestModal.tckn = input,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: (BorderSide(
                                color: Colors.green,
                              )),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            contentPadding: EdgeInsets.only(left: 15.0),
                            hintText: 'TC Kimlik Numaranızı Giriniz  *',
                            hintStyle:
                                TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                            errorStyle: TextStyle(color: Colors.green),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.pin_outlined,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      //
                      //
                      //
                      //
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: new TextFormField(
                          style: TextStyle(fontSize: 14),
                          onSaved: (input) => requestModal.website = input,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: (BorderSide(
                                color: Colors.green,
                              )),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            contentPadding: EdgeInsets.only(left: 15.0),
                            hintText: "Websitenizi giriniz.",
                            hintStyle:
                                TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                            errorStyle: TextStyle(color: Colors.green),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.language_outlined,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      //
                      //
                      //
                      //
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: new TextFormField(
                          style: TextStyle(fontSize: 14),
                          validator: (input) => input!.length < 10
                              ? "Lütfen telefon numaranızı alan kouyla birlikte giriniz."
                              : null,
                          onSaved: (input) => requestModal.phoneNumber = input,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: (BorderSide(
                                color: Colors.green,
                              )),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            contentPadding: EdgeInsets.only(left: 15.0),
                            hintText: 'Telefon Numaranızı giriniz  *',
                            hintStyle:
                                TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                            errorStyle: TextStyle(color: Colors.green),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.phone_iphone_outlined,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      //
                      //
                      //
                      //
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: new TextFormField(
                          style: TextStyle(fontSize: 14),
                          validator: (input) => input!.length < 6
                              ? "Lütfen Üniversitenizi giriniz."
                              : null,
                          onSaved: (input) => requestModal.university = input,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: (BorderSide(
                                color: Colors.green,
                              )),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            contentPadding: EdgeInsets.only(left: 15.0),
                            hintText: "Üniversite Bilgisi giriniz  *",
                            hintStyle:
                                TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                            errorStyle: TextStyle(color: Colors.green),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.school_outlined,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                        ),
                      ), //
                      //
                      //
                      //
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: new TextFormField(
                          style: TextStyle(fontSize: 14),
                          validator: (input) => input!.length < 6
                              ? "Lütfen mesleğinizi giriniz"
                              : null,
                          onSaved: (input) => requestModal.experiences = input,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: (BorderSide(
                                color: Colors.green,
                              )),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            contentPadding: EdgeInsets.only(left: 15.0),
                            hintText: "Mesleğinizi  giriniz  *",
                            hintStyle:
                                TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                            errorStyle: TextStyle(color: Colors.green),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.work_outlined,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                        ),
                      ), //
                      //
                      //
                      //
                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: new TextFormField(
                          keyboardType: TextInputType.multiline,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines: 5,
                          style: TextStyle(fontSize: 14),
                          onSaved: (input) => requestModal.address = input,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: (BorderSide(
                                color: Colors.green,
                              )),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            contentPadding: EdgeInsets.only(left: 15.0),
                            hintText: "Adresinizi  giriniz",
                            hintStyle:
                                TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                            errorStyle: TextStyle(color: Colors.green),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.maps_home_work_outlined,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: new TextFormField(
                          keyboardType: TextInputType.multiline,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.bottom,
                          minLines: 5, //Normal textInputField will be displayed
                          maxLines: 5,

                          style: TextStyle(fontSize: 14),
                          onSaved: (input) => requestModal.about = input,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: (BorderSide(
                                color: Colors.green,
                              )),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                            ),
                            contentPadding: EdgeInsets.only(left: 15.0),
                            hintText: "Kısaca kendinizi anlatınız",
                            hintStyle:
                                TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                            errorStyle: TextStyle(color: Colors.green),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.badge_outlined,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    update();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.all(20),
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                    child: Text(
                      'Bilgileri Kaydet',
                      style:
                          TextStyle(fontFamily: 'Nunito', color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  _ProfilePhotoState createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.5, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(70),
              image: new DecorationImage(
                fit: BoxFit.fitWidth,
                image: new NetworkImage(
                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
              )),
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
