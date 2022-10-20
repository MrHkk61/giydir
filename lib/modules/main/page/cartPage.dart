import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/gestures.dart';
import 'package:giydir/widget/button.dart';

class cartPage extends StatefulWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  State<cartPage> createState() => _cartPageState();
}

TextEditingController nameSurname = TextEditingController();
TextEditingController cartNumber = TextEditingController();
TextEditingController dateMounth = TextEditingController();
TextEditingController dateYear = TextEditingController();
TextEditingController ccv = TextEditingController();
TextEditingController cartName = TextEditingController();

class _cartPageState extends State<cartPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    final hsizeofmedia = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Kartımı Düzenle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: hsizeofmedia * 0.1,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Ad Soyad',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: nameSurname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    fillColor: Colors.white70),
              ),
            ),
            SizedBox(
              height: hsizeofmedia * 0.03,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Kredi kartı numarası',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: cartNumber,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    fillColor: Colors.white70),
              ),
            ),
            SizedBox(
              height: hsizeofmedia * 0.02,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: sizeofmedia * 0.15,
                      child: TextField(
                        controller: dateMounth,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 202, 196, 196)),
                            hintText: '01',
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: sizeofmedia * 0.15,
                      child: TextField(
                        controller: dateYear,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 202, 196, 196)),
                            hintText: '12',
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeofmedia * 0.35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: sizeofmedia * 0.15,
                      child: TextField(
                        controller: ccv,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 202, 196, 196)),
                            hintText: 'ccv',
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                ),
              ],
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
                          text: 'Bilgilerim kayıt edilsin.',
                          style: TextStyle(color: Color(0xff888795)),
                        ),
                        TextSpan(
                            text: ' Gizlilik Politikası',
                            style: const TextStyle(color: Color(0xff0BAFFF)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (() {
                                /*Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const registerPage()),
                                    (Route<dynamic> route) => false);*/
                              }))
                      ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: hsizeofmedia * 0.03,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Kredi kartı adı',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: cartName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    fillColor: Colors.white70),
              ),
            ),
            SizedBox(
              height: hsizeofmedia * 0.07,
            ),
            CartButton(context)
          ],
        ),
      ),
    );
  }
}
