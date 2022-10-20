import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:giydir/modules/main/page/cartPage.dart';
import 'package:giydir/modules/main/page/detailPage.dart';

class card extends StatefulWidget {
  const card({Key? key}) : super(key: key);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    final hsizeofmedia = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Sipariş Bilgisi")),
      body: Column(
        children: [
          SizedBox(
            height: hsizeofmedia * 0.05,
          ),
          Container(
            width: sizeofmedia * 0.9,
            height: hsizeofmedia * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: sizeofmedia * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: sizeofmedia * 0.75,
                          height: hsizeofmedia * 0.15,
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              SizedBox(
                                height: hsizeofmedia * 0.025,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Sipariş No       :000000",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: hsizeofmedia * 0.01,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Sipariş Tarihi  :25.03.2022",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: hsizeofmedia * 0.01,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Sipariş Detay :Kargoda",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: hsizeofmedia * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const detail()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: sizeofmedia * 0.015,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: sizeofmedia * 0.9,
                    height: hsizeofmedia * 0.08,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: const Text("Tribal Shape Shirt",
                                  style: TextStyle(
                                      color: Color(0xff363853), fontSize: 20)),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: sizeofmedia * 0.12,
                        ),
                        const Text("601.13",
                            style: TextStyle(
                                color: Color(0xff363853), fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: hsizeofmedia * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const detail()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: sizeofmedia * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: sizeofmedia * 0.9,
                    height: hsizeofmedia * 0.05,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: const Text("Satıcı:",
                                    style: TextStyle(
                                        color: Color(0xff363853),
                                        fontSize: 20)),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: sizeofmedia * 0.12,
                          ),
                          const Text("Giydir",
                              style: TextStyle(
                                  color: Color(0xff363853), fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: hsizeofmedia * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Container(
              child: const Text(
                "Ödeme Yöntemi",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: hsizeofmedia * 0.02,
          ),
          Container(
            width: sizeofmedia * 0.9,
            height: hsizeofmedia * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: Color(0xff0BAFFF),
                ),
                SizedBox(
                  width: sizeofmedia * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: sizeofmedia * 0.75,
                      height: hsizeofmedia * 0.15,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Adres İsmi",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: hsizeofmedia * 0.01,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "(704) 555-0127",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: hsizeofmedia * 0.01,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "3517 W. Gray St. Utica, Pennsylvania 57867",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: hsizeofmedia * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Container(
              child: const Text(
                "Ödeme Yöntemi",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: hsizeofmedia * 0.02,
          ),
          Container(
            width: sizeofmedia * 0.9,
            height: hsizeofmedia * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.credit_card,
                  color: Color(0xff0BAFFF),
                ),
                SizedBox(
                  width: sizeofmedia * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const cartPage()));
                      },
                      child: Container(
                        width: sizeofmedia * 0.75,
                        height: hsizeofmedia * 0.15,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Text(
                                  "Shift Bank",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: hsizeofmedia * 0.01,
                            ),
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "48 ****  ****  9874",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
