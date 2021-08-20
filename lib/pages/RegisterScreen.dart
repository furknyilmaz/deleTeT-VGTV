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
                            width: 280,
                            height: 100,
                            child: Image.asset("assets/logo.png"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SelectRoleButton(),
                        ),
                        new TextFormField(
                          style: TextStyle(fontSize: 12),
                          keyboardType: TextInputType.name,
                          onSaved: (input) => requestModal.name = input,
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
                            hintText: 'Lütfen adınızı giriniz',
                            hintStyle: TextStyle(fontSize: 12),
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
                        SizedBox(
                          height: 10,
                        ),
                        new TextFormField(
                          style: TextStyle(fontSize: 12),
                          validator: (input) => !input!.contains('@')
                              ? "Geçerli bir adres giriniz!"
                              : null,
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
                            hintStyle: TextStyle(fontSize: 12),
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
                          style: TextStyle(fontSize: 12),
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
                            hintText:
                                'En az 6 karakterli bir şifre belirleyiniz',
                            hintStyle: TextStyle(fontSize: 12),
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
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54),
                                  ),
                                  Text(
                                    ' kabul ediyorum',
                                    style: TextStyle(fontSize: 12),
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
                          child: Text('Giriş yap'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text("Zaten bir hesabınız var mı?"),
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
