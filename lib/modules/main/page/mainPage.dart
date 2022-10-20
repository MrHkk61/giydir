// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:giydir/modules/main/page/cabinetPage.dart';
import 'package:giydir/modules/main/page/discoverPage.dart';
import 'package:giydir/modules/main/page/home.dart';
import 'package:giydir/modules/main/page/likesPage.dart';
import 'package:giydir/modules/main/page/orderPage.dart';
import 'dart:math' as math;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    const home(),
    const likesPage(),
    const orderPage(),
    const cabinetPage(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _children[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 63,
        width: 63,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffFB774B), width: 1.0),
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 6),
                child: Transform.rotate(
                  angle: 310 * math.pi / 180,
                  child: const Icon(
                    Icons.send,
                    size: 35,
                    color: Color(0xffFB774B),
                  ),
                ),
              ),
              onTapDown: (details) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const discoverPage(),
                    ));
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: sizeofmedia * 0.15,
        child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Color.fromARGB(255, 255, 255, 255),
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    _selectedIndex = 0;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: _selectedIndex == 0
                        ? const Color(0xffFB774B)
                        : Color(0xff808080),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _selectedIndex = 1;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 30,
                    color: _selectedIndex == 1
                        ? const Color(0xffFB774B)
                        : Color(0xff808080),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 27)),
                IconButton(
                  onPressed: () {
                    _selectedIndex = 2;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: _selectedIndex == 2
                        ? const Color(0xffFB774B)
                        : Color(0xff808080),
                  ),
                ),
                //const Padding(padding: EdgeInsets.only(right: 20)),
                IconButton(
                  onPressed: () {
                    _selectedIndex = 3;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.person_pin,
                    size: 30,
                    color: _selectedIndex == 3
                        ? const Color(0xffFB774B)
                        : Color(0xff808080),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
