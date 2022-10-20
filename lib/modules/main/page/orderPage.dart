import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giydir/modules/main/page/checkOutPage.dart';
import 'package:giydir/widget/button.dart';

class orderPage extends StatefulWidget {
  const orderPage({Key? key}) : super(key: key);

  @override
  State<orderPage> createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    int custom = 2;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/image/appBarLogo.png',
          height: 70,
        ),
        toolbarHeight: 70,
        centerTitle: true,
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                return Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 4.2),
                    itemBuilder: (context, position) {
                      return orderBuild(context);
                    },
                    itemCount: 8,
                    //itemCount: listImage.length,
                  ),
                  margin: EdgeInsets.only(bottom: 8, left: 4, right: 4, top: 8),
                );
              },
            ),
          ),
          Column(
            children: [
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
              cardButton(context),
              SizedBox(
                height: sizeofmedia * 0.08,
              )
            ],
          )
        ],
      )),
    );
  }
}
