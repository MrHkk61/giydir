import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giydir/modules/main/page/webView.dart';
import 'package:giydir/widget/button.dart';
import 'package:giydir/services/fireStore.dart';
import '../../../services/firebaseAuth.dart';

class cabinetPage extends StatefulWidget {
  const cabinetPage({Key? key}) : super(key: key);

  @override
  State<cabinetPage> createState() => _cabinetPageState();
}

CollectionReference mail = FirebaseFirestore.instance.collection('users');

class _cabinetPageState extends State<cabinetPage> {
  String value = '';
  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Color(0xff196FDE).withOpacity(1).withBlue(210),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 32, 0, 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment(0.5, 2),
                  colors: <Color>[
                    Color(0xffFB774B),
                    Color(0xff196FDE),
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 58,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //deneme
                        Align(
                          alignment: Alignment.topLeft,
                          child: CircleAvatar(
                            radius: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/giydirr-ed555.appspot.com/o/files%2F$myUid%2Ffile?alt=media&token=950881d7-82a5-4fa6-a8c9-8046064a44be',
                                height: 60,
                                width: 60,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 3, 0, 0),
                            child: FutureBuilder<DocumentSnapshot>(
                              //Fetching data from the documentId specified of the student
                              future: mail
                                  .doc(myUid)
                                  .collection("profiles")
                                  .doc("public")
                                  .get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                //Error Handling conditions
                                if (snapshot.hasError) {
                                  return Text("Something went wrong");
                                }

                                if (snapshot.hasData &&
                                    !snapshot.data!.exists) {
                                  return const Text("Document does not exist",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold));
                                }

                                //Data is output to the user
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  return Text(
                                    " ${data['name']} ${data['surname']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  );
                                }

                                return Text("loading");
                              },
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton.small(
                              backgroundColor: Colors.white.withOpacity(0.53),
                              elevation: 0,
                              child: const Icon(
                                Icons.more_horiz,
                                size: 25,
                                color: Colors.black,
                              ),
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.black)),
                                  /*Border.all(color: Colors.black),*/
                                  backgroundColor: Colors.transparent,
                                  actions: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: profileButton(context),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: orderButton(context),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: adressButton(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FloatingActionButton.small(
                              heroTag: null,
                              elevation: 7,
                              backgroundColor: Colors.white.withOpacity(0.47),
                              onPressed: () {
                                logout(context);
                              },
                              child: const Icon(
                                Icons.exit_to_app,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    height: 58,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(12, 3, 0, 0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('1.208',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffffffff))),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Align(
                                child: Text('Takipçi',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffffffff))),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 3, 0, 0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('207',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffffffff))),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Align(
                                child: Text('Takip',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffffffff))),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 3, 0, 0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('726',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffffffff))),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25),
                              child: Align(
                                child: Text('Gönderi',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffffffff))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.124,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xffffffff),
                              fixedSize: const Size(120, 38),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Takip Et',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff1E1E1E),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        child: Card(
                          color: Colors.white.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      FutureBuilder<DocumentSnapshot>(
                        //Fetching data from the documentId specified of the student
                        future: mail
                            .doc(myUid)
                            .collection("profiles")
                            .doc("public")
                            .get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          //Error Handling conditions
                          if (snapshot.hasError) {
                            return const Text(
                              "Something went wrong",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            );
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return const Text("Document does not exist",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white));
                          }

                          //Data is output to the user
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            value = data['instagram'];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            webView(value: value)));
                              },
                              child: Text(
                                " ${data['instagram']} ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }

                          return Text("loading");
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        child: Card(
                          color: Colors.white.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.twitch,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                      ),
                      FutureBuilder<DocumentSnapshot>(
                          //Fetching data from the documentId specified of the student
                          future: mail
                              .doc(myUid)
                              .collection("profiles")
                              .doc("public")
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            //Error Handling conditions
                            if (snapshot.hasError) {
                              return Text("Something went wrong");
                            }
                            if (snapshot.hasData && !snapshot.data!.exists) {
                              return const Text("Document does not exist",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white));
                            }

                            //Data is output to the user
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              Map<String, dynamic> data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              value = data['twitch'];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              webView(value: value)));
                                },
                                child: Text(
                                  " ${data['twitch']} ",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }

                            return Text("loading");
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        child: Card(
                          color: Colors.white.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      FutureBuilder<DocumentSnapshot>(
                          //Fetching data from the documentId specified of the student
                          future: mail
                              .doc(myUid)
                              .collection("profiles")
                              .doc("public")
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            //Error Handling conditions
                            if (snapshot.hasError) {
                              return Text("Something went wrong");
                            }

                            if (snapshot.hasData && !snapshot.data!.exists) {
                              return const Text("Document does not exist",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white));
                            }

                            //Data is output to the user
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              Map<String, dynamic> data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              value = data['twitter'];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              webView(value: value)));
                                },
                                child: Text(
                                  " ${data['twitter']} ",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                            return const Text("loading",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white));
                          })
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
              ),
              child: SizedBox(
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: sizeofmedia * 0.001,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 390,
                              height: 199,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        color: Color(0xffFAFCFF),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text('Dolabım        ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff000000))),
                                        ),
                                      ),
                                      Container(
                                        width: 130,
                                        height: 170,
                                        color:
                                            Color.fromARGB(255, 248, 245, 245),
                                        child: cabinetBuild(context),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Container(
                                      width: 130,
                                      height: 170,
                                      color: Color.fromARGB(255, 248, 245, 245),
                                      child: cabinetBuild(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: sizeofmedia * 0.001,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 386,
                              height: 230,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text('Kombinlerim',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff000000))),
                                        ),
                                      ),
                                      Container(
                                        width: 130,
                                        height: 200,
                                        color:
                                            Color.fromARGB(255, 248, 245, 245),
                                        child: profileBuild(context),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      width: 130,
                                      height: 200,
                                      color: Color.fromARGB(255, 248, 245, 245),
                                      child: profileBuild(context),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
