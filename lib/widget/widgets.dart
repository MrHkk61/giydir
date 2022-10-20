import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giydir/modules/main/page/card.dart';
import 'package:giydir/modules/main/page/detailPage.dart';
import 'package:giydir/modules/main/page/orderInfoPage.dart';
import 'package:giydir/services/fireStore.dart';

Widget orderSBuild(BuildContext context) {
  final sizeofmedia = MediaQuery.of(context).size.width;
  int custom = 2;
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const card()),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Tribal Shape Shirt",
                        style:
                            TextStyle(color: Color(0xff363853), fontSize: 20)),
                  ),
                ],
              ),
              SizedBox(
                width: sizeofmedia * 0.12,
              ),
              const Text("601.13",
                  style: TextStyle(color: Color(0xff363853), fontSize: 20)),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget searchBuild(BuildContext context) {
  final sizeofmedia = MediaQuery.of(context).size.width;
  int custom = 2;
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const detail()),
      );
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          width: sizeofmedia * 0.90,
          height: sizeofmedia * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffF2F2F2)),
                  width: sizeofmedia * 0.14,
                  height: sizeofmedia * 0.14,
                ),
              ),
              SizedBox(
                width: sizeofmedia * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text("Tribal Shape Shirt",
                        style:
                            TextStyle(color: Color(0xff363853), fontSize: 20)),
                  ),
                  SizedBox(
                    width: sizeofmedia * 0.05,
                  ),
                  const Text("500K searches",
                      style: TextStyle(color: Color(0xffA2A1AB), fontSize: 17)),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
