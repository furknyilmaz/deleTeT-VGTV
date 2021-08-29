import 'package:deletedvgtv/pages/LoginScreen.dart';
import 'package:deletedvgtv/models/login_model.dart';
import 'package:deletedvgtv/utils/userRegister.dart';
import 'package:deletedvgtv/widgets/ProgressHUD.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterPageeState createState() => _RegisterPageeState();
}

class _RegisterPageeState extends State<RegisterScreen> {
  final scoffoldKey = GlobalKey<ScaffoldState>();
  final programssKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalKeyForm = new GlobalKey<FormState>();

  late RegisterRequestModal requestModal;
  bool isApiCallProgress = false;
  bool checkbox = false;
  int roleStatus = 1;

  @override
  void initState() {
    super.initState();
    requestModal = new RegisterRequestModal();
    requestModal.role = 1;
    print(requestModal);
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      key: programssKey,
      child: _uiSteup(context),
      inAsyncCall: isApiCallProgress,
      opacity: 0.3,
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  Widget _uiSteup(BuildContext context) {
    var screen = MediaQuery.of(context);
    final double width = screen.size.width;
    final double itemWidth = (width / 2) - 15;
    return Scaffold(
        key: scoffoldKey,
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Form(
                    key: globalKeyForm,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: SizedBox(
                            width: 280,
                            height: 90,
                            child: Image.asset("assets/vgplus.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      role = true;
                                      print(role);
                                      requestModal.role = 2;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.green),
                                      color: role ? Colors.green : Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                    ),
                                    width: 120,
                                    height: 35,
                                    child: Text(
                                      'Kurumsal',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          color: role
                                              ? Colors.white
                                              : Colors.grey.shade800,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      role = false;
                                      requestModal.role = 1;
                                      print(role);
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.green),
                                      color:
                                          !role ? Colors.green : Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    width: 120,
                                    height: 35,
                                    child: Text(
                                      'Bireysel',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          color: !role
                                              ? Colors.white
                                              : Colors.grey.shade800,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width / 2 - 45,
                              child: new TextFormField(
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                ),
                                validator: (input) => input!.length < 2
                                    ? "Lütfen tam adınızı giriniz!"
                                    : null,
                                keyboardType: TextInputType.name,
                                onSaved: (input) =>
                                    requestModal.firstName = input,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: (BorderSide(
                                      color: Colors.green,
                                    )),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 15.0),
                                  hintText: 'Adınız',
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Nunito',
                                  ),
                                  errorStyle: TextStyle(color: Colors.green),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.person_rounded,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: width / 2 - 45,
                              child: new TextFormField(
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Nunito',
                                ),
                                validator: (input) => input!.length < 2
                                    ? "Lütfen soyadınızı giriniz!"
                                    : null,
                                keyboardType: TextInputType.name,
                                onSaved: (input) =>
                                    requestModal.lastName = input,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: (BorderSide(
                                      color: Colors.green,
                                    )),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 15.0),
                                  hintText: 'Soyadınız',
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Nunito',
                                  ),
                                  errorStyle: TextStyle(color: Colors.green),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.person_rounded,
                                    color: Colors.green,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        new TextFormField(
                          style: TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                          validator: (input) =>
                              input!.contains('@') && input.contains('.')
                                  ? null
                                  : "Geçerli bir adres giriniz!",
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => requestModal.email = input,
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
                            hintText: 'E-posta adresinizi giriniz',
                            hintStyle:
                                TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                            errorStyle: TextStyle(
                                color: Colors.green, fontFamily: 'Nunito'),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        new TextFormField(
                          style: TextStyle(fontSize: 12),
                          validator: (input) => input!.length < 6
                              ? "En az 6 karakterli bir şifre belirleyiniz"
                              : null,
                          keyboardType: TextInputType.visiblePassword,
                          onSaved: (input) => requestModal.password = input,
                          obscureText: true,
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
                            hintText: 'Şifrenizi giriniz.',
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
                              Icons.lock,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, left: 0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: checkbox,
                                onChanged: (onChanged) => {
                                  setState(() {
                                    checkbox = !checkbox;
                                  })
                                },
                                activeColor: Colors.green,
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' Kullanıcı sözleşmesinini',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54),
                                  ),
                                  Text(
                                    ' kabul ediyorum',
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: 'Nunito'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.grey.shade300,
                              fixedSize: Size(350, 35)),
                          onPressed: () {
                            register();
                          },
                          child: Text(
                            'Kayıt Ol',
                            style: TextStyle(fontFamily: 'Nunito'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                            "Zaten bir hesabınız var mı?",
                            style: TextStyle(fontFamily: 'Nunito'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreenPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Hemen Oturum Aç',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> register() async {
    final form = globalKeyForm.currentState;

    if (form!.validate()) {
      if (checkbox) {
        setState(() {
          isApiCallProgress = true;
        });
        form.save();
        userRegister(requestModal, context)
            .then((value) => isApiCallProgress = false);
      } else {
        final snackBar = SnackBar(
          backgroundColor: Color(0xff38a3a5),
          content: Text('Lüften kullanıcı sözleşmesini okuyun ve kabul edin.'),
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
  }
}

bool role = false;
