import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formKey = GlobalKey<FormState>();
  var tfAd = TextEditingController();
  var tfEmail = TextEditingController();
  var tfSifre = TextEditingController();
  var tfSifreTekrar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: tfAd,
                      decoration: InputDecoration(
                        hintText: " Ad",
                        border: OutlineInputBorder(),
                      ),
                      validator: (tfgirdisi) {
                        if (tfgirdisi!.isEmpty) {
                          return "Kullanıcı adı giriniz";
                        }
                        return null;
                      },
                    ),
                    spacer(),
                    TextFormField(
                      controller: tfEmail,
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        border: OutlineInputBorder(),
                      ),
                      validator: (tfgirdisi) {
                        if (tfgirdisi!.isEmpty) {
                          return "E-mail adresinizi giriniz";
                        }
                        return null;
                      },
                    ),
                    spacer(),
                    TextFormField(
                      controller: tfSifre,
                      decoration: InputDecoration(
                        hintText: "Şifre",
                        border: OutlineInputBorder(),
                      ),
                      validator: (tfgirdisi) {
                        if (tfgirdisi!.isEmpty) {
                          return "Bir şifre giriniz";
                        } else if (tfgirdisi.length < 6) {
                          return "Şifreniz en az 6 haneli olmalıdır";
                        } else {
                          return null;
                        }
                      },
                    ),
                    spacer(),
                    TextFormField(
                      controller: tfSifreTekrar,
                      decoration: InputDecoration(
                        hintText: "Şifre Tekrar",
                        border: OutlineInputBorder(),
                      ),
                      validator: (tfgirdisi) {
                        if (tfgirdisi!.isEmpty) {
                          return "Şifrenizi tekrar giriniz";
                        } else if (tfgirdisi == tfSifre.text) {
                          return null;
                        } else {
                          return "Şifrelerniz aynı değil";
                        }
                      },
                    ),
                    spacer(),
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: double.maxFinite,
                        child: Center(child: Text("KAYIT OL")),
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: Colors.black12, width: 1)),
                      ),
                      onTap: () {
                        bool kontrolSonucu = formKey.currentState!.validate();

                        if (kontrolSonucu) {
                          String ka = tfAd.text;
                          String s = tfSifre.text;
                          print("Kullanıcı adı : $ka - Şifre : $s");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox spacer() {
    return SizedBox(
      height: 30,
    );
  }
}
