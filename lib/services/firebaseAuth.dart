import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:giydir/modules/main/page/home.dart';
import 'package:giydir/modules/main/page/likesPage.dart';
import 'package:giydir/modules/main/page/mainPage.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';

import '../modules/main/page/afterRegisterPage.dart';
import '../page/landing.dart';
import '../page/login.dart';

int a = 0;

Future<void> registerApp(context, email, password) async {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((kullanici) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(kullanici.user!.uid)
          .set({
        "mail": email,
        "userid": kullanici.user!.uid,
        "registrationDate": formattedDate,
      });
    });
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const AfterRegister()),
        (Route<dynamic> route) => false);

    Fluttertoast.showToast(
        msg: 'Kayıt Başarılı',
        backgroundColor: Colors.green,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        fontSize: 16.0);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-email') {
      Fluttertoast.showToast(
          msg: 'Geçersiz E-Posta Adresi',
          backgroundColor: Colors.red,
          textColor: const Color(0xffffffff),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16.0);
    } else if (e.code == 'email-already-in-use') {
      Fluttertoast.showToast(
          msg: 'E-Posta Adresi Kullanılmaktadır',
          backgroundColor: Colors.red,
          textColor: const Color(0xffffffff),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16.0);
    }
  }

  /*DateTime now = DateTime.now();
  String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
  if (email.isEmpty || password.isEmpty || password2.isEmpty) {
    Fluttertoast.showToast(
        msg: 'Boş Kısımları Doldurunuz',
        backgroundColor: Colors.red,
        textColor: const Color(0xffffffff),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        fontSize: 16.0);
  } else if (password != password2) {
    Fluttertoast.showToast(
        msg: 'Şifreler Uyuşmamaktadır',
        backgroundColor: Colors.red,
        textColor: const Color(0xffffffff),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        fontSize: 16.0);
  } else {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((kullanici) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(kullanici.user!.uid)
          .set({
        "mail": email,
        "userid": kullanici.user!.uid,
        "registrationDate": formattedDate,
      });
    });
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const AfterRegister()),
        (Route<dynamic> route) => false);
  }*/
}

logIn(context, email, password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((kullanici) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MainPage()),
          (Route<dynamic> route) => false);
    });
  } on FirebaseAuthException catch (e) {
    if ((e.code == "wrong-password")) {
      Fluttertoast.showToast(
          msg: 'Hatalı Şifre',
          backgroundColor: Colors.red.shade600,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16.0);
      a++;
    } else if (e.code == "user-not-found") {
      Fluttertoast.showToast(
          msg: 'Kullanıcı Bulunamadı',
          backgroundColor: Colors.red.shade600,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16.0);
      a++;
    } else {
      Fluttertoast.showToast(
          msg: 'Eksik veya Hatalı Giriş',
          backgroundColor: Colors.red.shade600,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16.0);
      a++;
    }
  }

  if (a == 0) {
    Fluttertoast.showToast(
        msg: 'Giriş Başarılı ',
        backgroundColor: Colors.green,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        fontSize: 16.0);
  }
  a = 0;
}

logout(context) async {
  try {
    login_email.clear();
    login_password.clear();

    await FirebaseAuth.instance.signOut().then((deger) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LandingPage()),
          (Route<dynamic> route) => false);
    });
  } on FirebaseAuthException catch (e) {
    print(e.code);
  } finally {
    Fluttertoast.showToast(
        msg: 'Çıkış Başarılı',
        backgroundColor: Colors.green,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        fontSize: 16.0);
  }
}
