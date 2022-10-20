import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:giydir/page/login.dart';
import 'package:giydir/page/register.dart';
import 'package:giydir/widget/button.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:giydir/page/forgotRegister.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController forgot_email = TextEditingController();
TextEditingController login_email = TextEditingController();
TextEditingController login_password = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/image/appBarLogo.png',
              height: 80,
            )),
        toolbarHeight: 70,
        actions: <Widget>[],
      ),
      body: ListView(children: [
        Column(
          children: [
            SizedBox(height: sizeofmedia * 0.20),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Seç, Dene ve Al.',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: sizeofmedia * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Giydirle alışverişlerde kararsız kalmaya SON.',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
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
                controller: login_email,
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
                  hintText: 'email@example.com',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Şifre',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: login_password,
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
                  hintText: 'şifre',
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 18),
                child: InkWell(
                  child: const Text(
                    'Şifremi Unuttum?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff0BAFFF),
                    ),
                  ),
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      actions: <Widget>[
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 40),
                          child: TextField(
                            controller: forgot_email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                margin: const EdgeInsets.only(right: 4),
                                decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Color(0xffE2E1EC), width: 2)),
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: const Color(0xff363853),
                                  size:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              hintText: 'email@example.com',
                            ),
                          ),
                        ),
                        sendButton(context),
                      ],
                    ),
                  ),
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
                    const Text(
                      'Beni Hatırla',
                      style: TextStyle(
                        color: Color(0xff363853),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            LoginButton(context),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  const TextSpan(
                    text: 'Üye değil misin?',
                    style: TextStyle(color: Color(0xff888795)),
                  ),
                  TextSpan(
                      text: ' Kayıt ol',
                      style: const TextStyle(color: Color(0xff0BAFFF)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const registerPage()),
                              (Route<dynamic> route) => false);
                        }))
                ]),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
