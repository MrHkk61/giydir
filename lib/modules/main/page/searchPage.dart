import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:giydir/widget/button.dart';
import 'package:giydir/widget/widgets.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    final hsizeofmedia = MediaQuery.of(context).size.height;

    final sizeofmedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Arama"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: hsizeofmedia * 0.88,
                width: sizeofmedia * 0.90,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: hsizeofmedia * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Container(
                        width: sizeofmedia * 0.9,
                        height: sizeofmedia * 0.12,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              margin: const EdgeInsets.only(right: 4),
                              decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Color(0xffE2E1EC), width: 2)),
                              ),
                              child: Icon(
                                Icons.search,
                                color: const Color(0xff363853),
                                size: MediaQuery.of(context).size.width * 0.07,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: hsizeofmedia * 0.01,
                    ),
                    const Text(
                      "Son Aramalar",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: hsizeofmedia * 0.01,
                    ),
                    searchBuild(context),
                    SizedBox(
                      height: hsizeofmedia * 0.01,
                    ),
                    searchBuild(context),
                    SizedBox(
                      height: hsizeofmedia * 0.01,
                    ),
                    searchBuild(context),
                    SizedBox(
                      height: hsizeofmedia * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: hsizeofmedia * 0.01,
                          width: sizeofmedia * 0.04,
                        ),
                        CardBuild(context),
                        SizedBox(
                          height: hsizeofmedia * 0.01,
                          width: sizeofmedia * 0.04,
                        ),
                        CardBuild(context)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
