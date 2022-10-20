// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:giydir/page/login.dart';
import 'package:giydir/widget/button.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giydir',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var a = 'Başlayalım';
  String istapped = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 400,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      "assets/image/logo.png",
                      width: 200,
                      height: 200,
                    ),
                  ]),
            ),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Giydir",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff363853),
                            fontWeight: FontWeight.bold)))),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Giydirle alışverişlerde kararsız kalmaya son.",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff363853),
                            fontStyle: FontStyle.normal)))),
            const SizedBox(
              height: 50,
            ),
            LandingButton(context),
            /*
            RaisedButton(
              shape: RoundedRectangleBorder(
                
                  borderRadius: BorderRadius.circular(10),),
              padding: const EdgeInsets.all(20),
              
              textColor: Colors.white,
              color: const Color.fromRGBO(251, 119, 75, 1),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              child: const Text('Başlayalım'),
            ),*/
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(236, 235, 235, 1),
    );
  }
}
