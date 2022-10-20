import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:giydir/modules/main/page/chatPage.dart';

class chatMenuPage extends StatefulWidget {
  const chatMenuPage({Key? key}) : super(key: key);

  @override
  State<chatMenuPage> createState() => _chatMenuPageState();
}

class _chatMenuPageState extends State<chatMenuPage> {
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Mesajlarım"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            width: sizeofmedia * 0.9,
            height: sizeofmedia * 0.19,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: sizeofmedia * 0.06,
                      child: const Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Maciej Kowalski',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Text(
                      '1 FEB 12:00',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: 25,
                        child: Image.asset(
                          'assets/image/icon.png',
                          height: 45,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'I am almost finish. Please give me',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const chatPage(),
                ));
          },
        ),
      ),
      /*Container(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        width: sizeofmedia * 0.58,
        height: sizeofmedia * 0.15,
        color: Colors.amber,
        child: Column(
          children: [
            Container(
              width: sizeofmedia * 0.6,
              height: sizeofmedia * 0.040,
              color: Color.fromARGB(255, 181, 140, 140),
              
            )
          ],
        ),
      ),*/
    );
  }
}
