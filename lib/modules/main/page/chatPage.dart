import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class chatPage extends StatefulWidget {
  const chatPage({Key? key}) : super(key: key);

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sohbet"),
      ),
      body: Column(
        children: [
          Container(
            height: sizeofmedia * 0.12,
            color: Colors.transparent,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 25,
                    child: Image.asset(
                      'assets/image/icon.png',
                      height: 40,
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: sizeofmedia * 0.06,
                  child: const Padding(
                    padding: const EdgeInsets.only(left: 85),
                    child: Text(
                      'Maciej Kowalski',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '1 FEB 12:00',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: sizeofmedia * 0.05,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffFB774B),
              ),
              width: sizeofmedia * 0.9,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "I commented on Figma, I want to add some fancy icons. Do you have any icon set?",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeofmedia * 0.03,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff066BEF),
              ),
              width: sizeofmedia * 0.9,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "I am in a process of designing some. When do you need them? ",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeofmedia * 0.03,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffFB774B),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Next month?",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeofmedia * 0.03,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff066BEF),
              ),
              width: sizeofmedia * 0.9,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "I am almost finish. Please give me your email, I will ZIP them and send you as son as im finish.",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
