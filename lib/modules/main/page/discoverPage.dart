import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:giydir/widget/button.dart';

class discoverPage extends StatefulWidget {
  const discoverPage({Key? key}) : super(key: key);

  @override
  State<discoverPage> createState() => _discoverPageState();
}

TextEditingController main_search = TextEditingController();

class _discoverPageState extends State<discoverPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    final sizeofmedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'assets/image/appBarLogo.png',
          height: 80,
        ),
        toolbarHeight: 70,
        centerTitle: true,
        actions: <Widget>[
          AnimSearchBar(
            width: 390,
            textController: textController,
            onSuffixTap: () {
              setState(() {
                textController.clear();
              });
            },
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: [
          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: main_search,
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 4),
                  decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Color(0xffE2E1EC), width: 2)),
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
                hintText: 'Arama',
              ),
            ),
          ),*/
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
                  margin: EdgeInsets.only(bottom: 8, left: 4, right: 4, top: 8),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
