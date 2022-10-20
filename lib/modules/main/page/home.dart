import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:giydir/modules/main/page/chatMenuPage.dart';
import 'package:giydir/modules/main/page/searchPage.dart';
import 'package:giydir/widget/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

TextEditingController main_search = TextEditingController();

class _homeState extends State<home> {
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
        actions: <Widget>[
          Container(
            height: 45,
            width: 45,
            margin: const EdgeInsets.fromLTRB(0, 13, 11, 13),
            decoration: BoxDecoration(
              color: const Color(0xffFB774B),
              borderRadius: BorderRadius.circular(13),
            ),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.solidComments),
              color: const Color(0xffffffff),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const chatMenuPage(),
                    ));
              },
              iconSize: 22,
            ),
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: [
          SizedBox(height: sizeofmedia * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Ana Sayfa',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              /*const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Seç, Dene ve Al',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
                  color: const Color(0xff000000),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const searchPage(),
                        ));
                  },
                  iconSize: 22,
                ),
              ),
            ],
          ),
          /* Padding(
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
