import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:giydir/modules/main/page/tryPage.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:giydir/widget/button.dart';

class detail extends StatefulWidget {
  const detail({Key? key}) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    final hsizeofmedia = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Container(
              width: sizeofmedia * 0.8,
              height: hsizeofmedia * 0.42,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TryPage()),
                    );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Colors.black)),
                    child: Image.asset(
                      'assets/image/icon.png',
                      height: 40,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: hsizeofmedia * 0.01,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 50),
                height: hsizeofmedia * 0.05,
                width: sizeofmedia * 1,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ürün adı",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: FavoriteButton(
                        isFavorite: true,
                        // iconDisabledColor: Colors.white,
                        valueChanged: (_isFavorite) {
                          print('Is Favorite : $_isFavorite');
                        },
                        iconSize: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 50),
                width: sizeofmedia * 0.8,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "000.00",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Satıcı: Giydir",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Text(
                "500",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: hsizeofmedia * 0.02,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                "Select Size",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: hsizeofmedia * 0.24,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Container(
                    height: hsizeofmedia * 0.1,
                    width: sizeofmedia * 0.2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(32, 25, 0, 0),
                      child: Text(
                        "S",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeofmedia * 0.02,
                ),
                Container(
                  height: hsizeofmedia * 0.1,
                  width: sizeofmedia * 0.2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 25, 0, 0),
                    child: Text(
                      "M",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeofmedia * 0.02,
                ),
                Container(
                  height: hsizeofmedia * 0.1,
                  width: sizeofmedia * 0.2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 25, 0, 0),
                    child: Text(
                      "L",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: sizeofmedia * 0.02,
                ),
                Container(
                  height: hsizeofmedia * 0.1,
                  width: sizeofmedia * 0.2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 0, 0),
                    child: Text(
                      "XL",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          detailButton(context)
        ],
      ),
    );
  }
}
