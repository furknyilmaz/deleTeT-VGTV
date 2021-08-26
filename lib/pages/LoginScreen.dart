import 'package:deletedvgtv/models/login_model.dart';
import 'package:deletedvgtv/pages/RegisterScreen.dart';
import 'package:deletedvgtv/utils/userLogin.dart';
import 'package:deletedvgtv/widgets/ProgressHUD.dart';
import 'package:flutter/material.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({Key? key}) : super(key: key);

  @override
  _LoginScreenPAgeState createState() => _LoginScreenPAgeState();
}

class _LoginScreenPAgeState extends State<LoginScreenPage> {
  final scoffoldKey = GlobalKey<ScaffoldState>();
  final programssKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalKeyForm = new GlobalKey<FormState>();

  late LoginRequestModal requestModal;
  bool isApiCallProgress = false;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    requestModal = new LoginRequestModal();
    print(requestModal.toJson());
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
                            width: 250,
                            height: 90,
                            child: Image.asset("assets/vgplus.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          //child: SelectRoleButton(),
                        ),
                        new TextFormField(
                          style: TextStyle(fontSize: 16, fontFamily: 'Nunito'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) => !input!.contains('@')
                              ? "Geçerli bir adres giriniz!"
                              : null,
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
                            hintText: 'E-posta adresiniz giriniz',
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
                              Icons.mail_outline,
                              color: Colors.green,
                              size: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            onSaved: (input) => requestModal.password = input,
                            obscureText: true,
                            style:
                                TextStyle(fontSize: 16, fontFamily: 'Nunito'),
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
                              contentPadding: EdgeInsets.only(left: 5.0),
                              hintText: 'Şifrenizi Giriniz',
                              hintStyle:
                                  TextStyle(fontSize: 12, fontFamily: 'Nunito'),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.green, width: 5.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.0)),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.green,
                                size: 18,
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.grey.shade300,
                              fixedSize: Size(350, 35)),
                          onPressed: () {
                            login();
                          },
                          child: Text(
                            'Giriş yap',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                            "Henüz hesap oluşturmadın mı?",
                            style: TextStyle(fontFamily: 'Nunito'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Hemen Kayıt Ol',
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

  Future<void> login() async {
    final form = globalKeyForm.currentState;
    if (form!.validate()) {
      setState(() {
        isApiCallProgress = true;
      });
      form.save();
      userLogin(requestModal, context);
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          isApiCallProgress = false;
        });
      });
    }
  }
}

bool role = false;

class SelectRoleButton extends StatefulWidget {
  const SelectRoleButton({Key? key}) : super(key: key);

  @override
  _SelectRoleButtonState createState() => _SelectRoleButtonState();
}

class _SelectRoleButtonState extends State<SelectRoleButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                role = true;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.green),
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
                    color: role ? Colors.white : Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                role = false;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.green),
                color: !role ? Colors.green : Colors.white,
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
                    color: !role ? Colors.white : Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
