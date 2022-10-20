// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:giydir/widget/button.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class likesPage extends StatefulWidget {
  const likesPage({Key? key}) : super(key: key);

  @override
  State<likesPage> createState() => _likesPageState();
}

class _likesPageState extends State<likesPage> {
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
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
          //color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: sizeofmedia * 0.02),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Beğenilenler',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    return Container(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                        itemBuilder: (context, position) {
                          return CardBuild(context);
                        },
                        itemCount: 6,
                        //itemCount: listImage.length,
                      ),
                      margin:
                          EdgeInsets.only(bottom: 8, left: 4, right: 4, top: 8),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
