import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:flutter/gestures.dart';
import 'package:giydir/widget/button.dart';

class adressPAge extends StatefulWidget {
  const adressPAge({Key? key}) : super(key: key);

  @override
  State<adressPAge> createState() => _adressPAgeState();
}

TextEditingController address = TextEditingController();
TextEditingController city = TextEditingController();
TextEditingController district = TextEditingController();
TextEditingController Addressname = TextEditingController();
TextEditingController zipCode = TextEditingController();

class _adressPAgeState extends State<adressPAge> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    final hsizeofmedia = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Adres Düzenle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: hsizeofmedia * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Adres Adı',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: Addressname,
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
                  'Şehir',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: city,
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
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'İlçe',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: district,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    fillColor: Colors.white70),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Adres',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: address,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    fillColor: Colors.white70),
                maxLines: 5,
                minLines: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Posta Kodu',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 270),
              child: TextField(
                controller: zipCode,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    fillColor: Colors.white70),
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
              height: hsizeofmedia * 0.07,
            ),
            adressAddButton(context)
          ],
        ),
      ),
    );
  }
}
