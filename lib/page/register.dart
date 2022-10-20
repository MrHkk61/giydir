import 'package:flutter/material.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:flutter/gestures.dart';
import 'package:giydir/modules/main/page/afterRegisterPage.dart';
import '../widget/button.dart';
import 'login.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

TextEditingController register_email = TextEditingController();
TextEditingController register_password = TextEditingController();
TextEditingController register2_password = TextEditingController();

class _registerPageState extends State<registerPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff363853),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (Route<dynamic> route) => false);
          },
        ),
        title: Image.asset(
          'assets/image/appBarLogo.png',
          height: 80,
        ),
        toolbarHeight: 70,
        centerTitle: true,
      ),
      body: ListView(children: [
        Column(
          children: [
            SizedBox(height: sizeofmedia * 0.15),
            const Padding(
              padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Haydi,",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "sen de dene",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: register_email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(right: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                          right:
                              BorderSide(color: Color(0xffE2E1EC), width: 2)),
                    ),
                    child: Icon(
                      Icons.person,
                      color: const Color(0xff363853),
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  hintText: 'E-mail giriniz',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Şifre giriniz',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: register_password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(right: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                          right:
                              BorderSide(color: Color(0xffE2E1EC), width: 2)),
                    ),
                    child: Icon(
                      Icons.security,
                      color: const Color(0xff363853),
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  hintText: 'Şifre giriniz',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: register2_password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(right: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                          right:
                              BorderSide(color: Color(0xffE2E1EC), width: 2)),
                    ),
                    child: Icon(
                      Icons.security,
                      color: const Color(0xff363853),
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  hintText: 'Tekrar şifre giriniz',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                          unselectedWidgetColor: const Color(0xffE2E1EC)),
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: isChecked,
                        onChanged: (value) {
                          setState(() => isChecked = value!);
                        },
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        const TextSpan(
                          text: 'Okudum, kabul ediyorum.',
                          style: TextStyle(color: Color(0xff888795)),
                        ),
                        TextSpan(
                            text: ' Gizlilik Politikası',
                            style: const TextStyle(color: Color(0xff0BAFFF)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (() {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const AfterRegister()),
                                    (Route<dynamic> route) => false);
                              }))
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            registerButton(context),
          ],
        )
      ]),
    );
  }
}
