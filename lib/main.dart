import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giydir/page/landing.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // iboya #tten
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffFB774B),
        secondaryHeaderColor: const Color(0xff066BEF),
        backgroundColor: const Color(0xfffafafa),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          headline6: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold), //AppBar Text İçin
          bodyText1: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),

          bodyText2: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Color(0xff363853)), //Textler İçin
        ),
        appBarTheme: const AppBarTheme(
            brightness: Brightness.dark,
            backgroundColor: Color(0xfffafafa),
            iconTheme: IconThemeData(color: Color(0xff363853)),
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Color(0xff363853), fontFamily: 'Poppins', fontSize: 25)),

        ////////////////Buton//////////////////////////////
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(327, 55),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            primary: const Color(0xffFB774B),
            textStyle: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontFamily: 'Poppins',
                color: Colors.black),
          ),
        ),
        cardTheme: const CardTheme(
          //color: Color(0xffF2F2F2),
          color: Color(0xfffafafa),
          elevation: 0,
        ),
      ),
      home: const LandingPage(),
    );
  }
}
