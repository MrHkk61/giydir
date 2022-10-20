import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:giydir/widget/widgets.dart';

class orderInfoPage extends StatefulWidget {
  const orderInfoPage({Key? key}) : super(key: key);

  @override
  State<orderInfoPage> createState() => _orderInfoPageState();
}

class _orderInfoPageState extends State<orderInfoPage> {
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Siparişlerim"),
      ),
      body: Column(
        children: [
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
                          right:
                              BorderSide(color: Color(0xffE2E1EC), width: 2)),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xfffafafa),
                      elevation: 0,
                      fixedSize: const Size(100, 38),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 196, 194, 194)))),
                  onPressed: () {},
                  child: const Text(
                    'Tümü',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff1E1E1E),
                    ),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xfffafafa),
                      elevation: 0,
                      fixedSize: const Size(100, 38),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 196, 194, 194)))),
                  onPressed: () {},
                  child: const Text(
                    'İadeler',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff1E1E1E),
                    ),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xfffafafa),
                      elevation: 0,
                      fixedSize: const Size(100, 38),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 196, 194, 194)))),
                  onPressed: () {},
                  child: const Text(
                    'İptaller',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff1E1E1E),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                return Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 4.2),
                    itemBuilder: (context, position) {
                      return orderSBuild(context);
                    },
                    itemCount: 8,
                    //itemCount: listImage.length,
                  ),
                  margin: EdgeInsets.only(bottom: 8, left: 4, right: 4, top: 8),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
