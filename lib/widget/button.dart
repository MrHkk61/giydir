import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giydir/modules/main/page/adressPage.dart';
import 'package:giydir/modules/main/page/afterRegisterPage.dart';
import 'package:giydir/modules/main/page/cabinetPage.dart';
import 'package:giydir/modules/main/page/checkOutPage.dart';
import 'package:giydir/modules/main/page/detailPage.dart';
import 'package:giydir/modules/main/page/home.dart';
import 'package:giydir/modules/main/page/mainPage.dart';
import 'package:giydir/modules/main/page/orderInfoPage.dart';
import 'package:giydir/modules/main/page/orderPage.dart';
import 'package:giydir/modules/main/page/successPage.dart';
import 'package:giydir/page/landing.dart';
import 'package:giydir/page/register.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../page/login.dart';
import '../services/firebaseAuth.dart';
import '../services/fireStore.dart';

Widget LandingButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
          (Route<dynamic> route) => false);
    },
    child: const Text('Başlayalım'),
  );
}

Widget cardButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const checkOutPage()),
      );
    },
    child: const Text('Seçili 6 ürün'),
  );
}

Widget infoButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const successPage()),
      );
    },
    child: const Text('Seçili 6 ürün'),
  );
}

Widget tryButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const checkOutPage()),
      );
    },
    child: const Text('Satın Al'),
  );
}

Widget detailButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const orderPage()),
      );
    },
    child: const Text('Sepete Ekle'),
  );
}

Widget LoginButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      logIn(context, login_email.text, login_password.text);
    },
    child: const Text('Giriş'),
  );
}

Widget sendButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () async {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgot_email.text)
          .then((value) => Fluttertoast.showToast(
              msg: 'Mail göderildi',
              backgroundColor: Colors.green,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2,
              fontSize: 16.0))
          .catchError((error) => print(error))
          .whenComplete(() => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
              (Route<dynamic> route) => false));
    },
    child: const Text('Gönder'),
  );
}

Widget profileButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: const Color(0xff33B249),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AfterRegister()),
      );
    },
    child: const Text('Profil Bilgilerim'),
  );
}

Widget orderButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: const Color(0xff33B249),
    ),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const orderInfoPage()));
    },
    child: const Text('Sipariş Bilgilerim'),
  );
}

Widget adressAddButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
    ),
    onPressed: () {
      addAdress(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const cabinetPage()));
    },
    child: const Text('Ekle'),
  );
}

Widget CartButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
    ),
    onPressed: () {
      addCart(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const cabinetPage()));
    },
    child: const Text('Ekle'),
  );
}

Widget adressButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: const Color(0xff33B249),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const adressPAge()),
      );
    },
    child: const Text('Adres Bilgilerim'),
  );
}

Widget registerButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      var mail = register_email.text;
      var pass = register_password.text;
      var pass2 = register2_password.text;
      if (mail.isEmpty || pass.isEmpty || pass2.isEmpty) {
        Fluttertoast.showToast(
            msg: 'Boş Kısımları Doldurunuz',
            backgroundColor: Colors.red,
            textColor: const Color(0xffffffff),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            fontSize: 16.0);
      } else if (pass != pass2) {
        Fluttertoast.showToast(
            msg: 'Şifreler Uyuşmamaktadır',
            backgroundColor: Colors.red,
            textColor: const Color(0xffffffff),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            fontSize: 16.0);
      } else {
        registerApp(context, mail, pass);
      }
    },
    child: const Text('Kayıt Ol'),
  );
}

CollectionReference urun = FirebaseFirestore.instance.collection('products');
Widget CardBuild(BuildContext context) {
  return Card(
      child: InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const detail()),
      );
    },
    child: Container(
      height: 250,
      width: 150,
      /*decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: const Color(0xfffafafa),
        ),
        borderRadius: BorderRadius.circular(20),
      ),*/
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 165,
                width: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.favorite,
                          color: const Color(0xffC4C4C4),
                          size: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                ),
              )),
          const Padding(
            padding: EdgeInsets.fromLTRB(35, 15, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Elbise',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xff363853)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(35, 20, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('100,00',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffFB774B),
                  )),
            ),
          ),
        ],
      ),
    ),
  ));
}

//----------------Profile BUİLD ------------------//
Widget profileBuild(BuildContext context) {
  return Card(
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Kombin ismi',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xff363853)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Alan:Düğün',
                  style: TextStyle(fontSize: 13, color: Color(0xff363853))),
            ),
          ),
          Row(
            children: [
              Container(
                height: 35,
                width: 30,
                child: Card(
                  color: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Color(0xffFB774B),
                    size: 16,
                  ),
                ),
              ),
              const Text(
                '20k',
                style: TextStyle(
                  color: Color(0xff363853),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                height: 35,
                width: 25,
                child: Card(
                  color: Colors.white.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.save,
                    color: Color(0xffFB774B),
                    size: 16,
                  ),
                ),
              ),
              const Text(
                '20k',
                style: TextStyle(
                  color: Color(0xff363853),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget cabinetBuild(BuildContext context) {
  return Card(
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ürün ismi',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xff363853)),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//----------------ORDER BUİLD ------------------//

Widget orderBuild(BuildContext context) {
  final sizeofmedia = MediaQuery.of(context).size.width;
  int custom = 2;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        width: sizeofmedia * 0.95,
        height: sizeofmedia * 0.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffF2F2F2)),
                width: sizeofmedia * 0.14,
                height: sizeofmedia * 0.14,
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 35, left: 35),
                  child: Icon(
                    Icons.circle_rounded,
                    color: Color(0xff0BAFFF),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: sizeofmedia * 0.04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text("Tribal Shape Shirt",
                      style: TextStyle(color: Color(0xff363853), fontSize: 20)),
                ),
                const Text("601.13",
                    style: TextStyle(color: Color(0xff363853), fontSize: 20)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE2E1EC)),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: sizeofmedia * 0.20,
                height: sizeofmedia * 0.07,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: sizeofmedia * 0.06,
                        height: sizeofmedia * 0.07,
                        color: Colors.transparent,
                        child: Ink(
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.minus),
                            color: Colors.black,
                            iconSize: 12,
                            onPressed: () {
                              custom -= 1;
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: sizeofmedia * 0.06,
                        height: sizeofmedia * 0.07,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("$custom"),
                        ),
                      ),
                      Container(
                        width: sizeofmedia * 0.06,
                        height: sizeofmedia * 0.07,
                        color: Colors.transparent,
                        child: Ink(
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.plus),
                            color: Colors.black,
                            iconSize: 12,
                            onPressed: () {
                              custom += 1;
                            },
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, right: 5),
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffFB774B),
                ),

                // color: Color.fromARGB(255, 168, 161, 161),
                //child: Ink(
                child: IconButton(
                  focusColor: Colors.amber,
                  icon: Icon(FontAwesomeIcons.trash),
                  color: Colors.white,
                  iconSize: 10,
                  onPressed: () {
                    custom += 1;
                  },
                ),
              ),
              //  ),
            ),
          ],
        ),
      ),
    ],
  );
}
