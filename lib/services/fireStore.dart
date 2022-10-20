import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giydir/modules/main/page/afterRegisterPage.dart';
import 'package:giydir/modules/main/page/cartPage.dart';
import 'package:giydir/modules/main/page/mainPage.dart';

import '../modules/main/page/adressPage.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? users = auth.currentUser;
final myUid = users!.uid;
/*CollectionReference profiles = FirebaseFirestore.instance
    .collection('users')
    .doc("$userId")
    .collection("profiles");*/

Future<void> addUser(context) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(myUid)
      .collection("profiles")
      .doc('public')
      .set({
        'name': name.text,
        'surname': surname.text,
        'number': tel.text,
        'instagram': "instagram.com/" + instagram.text,
        'twitch': "twitch.com/" + twitch.text,
        'twitter': "twitter.com/" + twitter.text,
      })
      .then((value) => Fluttertoast.showToast(
          msg: 'Kayıt Tamamlandı',
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16.0))
      .catchError((error) => print(error))
      .whenComplete(() => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MainPage()),
          (Route<dynamic> route) => false));
}

Future<void> addAdress(context) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(myUid)
      .collection("settings")
      .doc('payment')
      .set({
        "address": {
          'address': address.text,
          'city': city.text,
          'district': district.text,
          'zipCode': zipCode.text,
          "name": Addressname.text,
        }
        /* 'address': address.text,
        'city': city.text,
        'district': district.text,
        'zipCode': zipCode.text,
        "name": Addressname.text,*/
      }, SetOptions(merge: true))
      .then((value) => Fluttertoast.showToast(
          msg: 'Adres Eklendi',
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16.0))
      .catchError((error) => print(error))
      .whenComplete(() => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MainPage()),
          (Route<dynamic> route) => false));
}

Future<void> addCart(context) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(myUid)
      .collection("settings")
      .doc('payment')
      .set({
        "card": {
          'ccv': ccv.text,
          'dateMounth': dateMounth.text,
          'dateYear': dateYear.text,
          'name': cartName.text,
          "number": cartNumber.text,
        },
        /* 'address': address.text,
        'city': city.text,
        'district': district.text,
        'zipCode': zipCode.text,
        "name": Addressname.text,*/
      }, SetOptions(merge: true))
      .then((value) => Fluttertoast.showToast(
          msg: 'Kart Eklendi',
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          fontSize: 16.0))
      .catchError((error) => print(error))
      .whenComplete(() => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MainPage()),
          (Route<dynamic> route) => false));
}

CollectionReference mail = FirebaseFirestore.instance.collection('users');
var mailRef = mail.doc(myUid);
var mapMail = "";
/*mailGetir() async {
  var response = await mailRef.get();
  var map = response.data();

  print(map["mail"]);
  return map.toString();
}
*/
var mail3 = "";
var mail2;
/*mailGetir() async {
  await FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      if (myUid == doc["userid"]) {
        print(doc["mail"]);
        mail3 = doc["mail"];
      }
    });
  });
  return mail3;
}
*/
CollectionReference student = FirebaseFirestore.instance.collection('users');
