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

  @override
  void initState() {
    super.initState();
    requestModal = new RegisterRequestModal();
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
                            width: 200,
                            height: 100,
                            child: Image.asset("assets/logo.png"),
                          ),
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.name,
                          onSaved: (input) => requestModal.name = input,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15.0),
                            hintText: 'Adınızı giriniz',
                            hintStyle: TextStyle(fontSize: 12),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.person_rounded,
                              color: Colors.blue,
                              size: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (input) => !input!.contains('@')
                              ? "Geçerli bir adres girinikz!"
                              : null,
                          onSaved: (input) => requestModal.email = input,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15.0),
                            hintText: 'E-posta adresiniz giriniz',
                            hintStyle: TextStyle(fontSize: 12),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            prefixIcon: const Icon(
                              Icons.mail_outline,
                              color: Colors.blue,
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
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15.0),
                              hintText: 'Şifrenizi Giriniz',
                              hintStyle: TextStyle(fontSize: 12),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.blue,
                                size: 18,
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              register();
                            },
                            child: Text('Giriş yap')),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text("Zaten bir hesabınız var mı?"),
                        ),
                        TextButton(
                          child: Text(
                            'Hemen Oturum Aç',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreenPage(),
                              ),
                            );
                          },
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
      setState(() {
        isApiCallProgress = true;
      });
      form.save();
      userRegister(requestModal, context);
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          isApiCallProgress = false;
        });
      });
    }
  }
}
