import 'package:flutter/material.dart';
import 'package:giydir/widget/button.dart';

class TryPage extends StatefulWidget {
  const TryPage({Key? key}) : super(key: key);

  @override
  State<TryPage> createState() => _TryPageState();
}

class _TryPageState extends State<TryPage> {
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    final hsizeofmedia = MediaQuery.of(context).size.height;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
              width: sizeofmedia * 0.8,
              height: hsizeofmedia * 0.68,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                ),
              ),
            ),
          ),
          SizedBox(
            height: hsizeofmedia * 0.08,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: tryButton(context),
          )
        ],
      ),
    );
  }
}
