import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:giydir/modules/main/page/adressPage.dart';
import 'package:giydir/modules/main/page/cartPage.dart';
import 'package:giydir/widget/button.dart';

class checkOutPage extends StatefulWidget {
  const checkOutPage({Key? key}) : super(key: key);

  @override
  State<checkOutPage> createState() => _checkOutPageState();
}

class _checkOutPageState extends State<checkOutPage> {
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    final hsizeofmedia = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Bilgilerim")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                width: sizeofmedia * 0.9,
                height: hsizeofmedia * 0.05,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: const Text(
                        "Teslimat Adresi",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ),
                    InkWell(
                      child: const Text(
                        "Degiştir",
                        style: TextStyle(
                            color: Color(0xff0BAFFF),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const adressPAge()));
                      },
                    )
                  ],
                )),
          ),
          Column(
            children: [
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
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
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
                    "Teslimat Seçeneği",
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
                      Icons.all_inbox,
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
                                  " ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: hsizeofmedia * 0.01,
                              ),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "15  Standard delivery",
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
                                  "Delivered before Monday, 12 Apr 2021",
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
              SizedBox(
                height: hsizeofmedia * 0.05,
              ),
              Container(
                height: sizeofmedia * 0.15,
                color: Colors.white,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Toplam",
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
                    SizedBox(
                      width: sizeofmedia * 0.5,
                    ),
                    const Text(
                      "601.13",
                      style: TextStyle(fontSize: 23),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: hsizeofmedia * 0.05,
              ),
              infoButton(context)
            ],
          )
        ],
      ),
    );
  }
}
