// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giydir/main.dart';
import 'package:giydir/modules/main/page/home.dart';
import 'package:giydir/modules/main/page/mainPage.dart';
import 'package:giydir/services/fireStore.dart';
import 'package:giydir/widget/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../widget/profile_widget.dart';
import '../../../widget/textfield_widget.dart';

class AfterRegister extends StatefulWidget {
  const AfterRegister({Key? key}) : super(key: key);

  @override
  State<AfterRegister> createState() => _AfterRegisterState();
}

TextEditingController name = TextEditingController();
TextEditingController surname = TextEditingController();
TextEditingController tel = TextEditingController();
TextEditingController instagram = TextEditingController();
TextEditingController twitch = TextEditingController();
TextEditingController twitter = TextEditingController();
firebase_storage.FirebaseStorage storage =
    firebase_storage.FirebaseStorage.instance;

CollectionReference mail = FirebaseFirestore.instance.collection('users');

class _AfterRegisterState extends State<AfterRegister> {
  late final String imagePath;
  late File image;
  final ImagePicker _picker = ImagePicker();
  late bool isEdit = false;

  upGallery() async {
    var getPhoto = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (getPhoto != null) {
        image = File(getPhoto.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (image == null) return;
    final destination = 'files/$myUid';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(image);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeofmedia = MediaQuery.of(context).size.height;
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
          IconButton(
            color: Color(0xffFB774B),
            icon: const FaIcon(FontAwesomeIcons.solidCircleCheck),
            onPressed: () {
              addUser(context);
            },
            iconSize: 35,
          ),
        ],
        bottom: PreferredSize(
            child: Container(
              color: Color(0xffFB774B),
              height: 1.0,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: sizeofmedia * 0.013),
          SizedBox(height: sizeofmedia * 0.013),
          Column(
            children: [
              ClipOval(
                  child: Material(
                color: Colors.transparent,
                child: Ink.image(
                  image: isEdit
                      ? NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/giydirr-ed555.appspot.com/o/files%2F$myUid%2Ffile?alt=media&token=950881d7-82a5-4fa6-a8c9-8046064a44be")
                      : NetworkImage('https://i.hizliresim.com/d99w2bu.png'),
                  fit: BoxFit.cover,
                  width: 128,
                  height: 128,
                  child: InkWell(
                    onTap: () {
                      upGallery();
                      isEdit = true;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 90, top: 60),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
            ],
          ),
          Align(
              alignment: Alignment.center,
              child: FutureBuilder<DocumentSnapshot>(
                future: mail.doc(myUid).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return Text("Document does not exist");
                  }

                  //Data is output to the user
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Text(
                      " ${data['mail']} ",
                      style: TextStyle(fontSize: 20),
                    );
                  }

                  return Text("loading");
                },
              )),
          SizedBox(height: sizeofmedia * 0.01),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Kişisel Bilgiler',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'İsim',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Color(0xffE2E1EC), width: 2)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.addressCard,
                      color: const Color(0xff363853),
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '*Zorunlu',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Soyisim',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: TextField(
              controller: surname,
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Color(0xffE2E1EC), width: 2)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.idCard,
                      color: const Color(0xff363853),
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '*Zorunlu',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Telefon',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 1),
            child: TextField(
              controller: tel,
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Color(0xffE2E1EC), width: 2)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(
                      FontAwesomeIcons.addressCard,
                      color: const Color(0xff363853),
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Bu Bilgiyi Neden İstiyoruz?',
                    style: const TextStyle(color: Color(0xff0BAFFF)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = (() {
                        ///////dasdasdasdasdas
                      }))
              ]),
            ),
          ),
          SizedBox(height: sizeofmedia * 0.015),
          PreferredSize(
              child: Container(
                color: Colors.black.withOpacity(0.3),
                height: 1.0,
                width: 7,
              ),
              preferredSize: Size.fromHeight(4.0)),
          SizedBox(height: sizeofmedia * 0.015),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sosyal Medya',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Instagram',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: TextField(
              controller: instagram,
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Color(0xffE2E1EC), width: 2)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: const Color(0xff363853),
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Twitch',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: TextField(
              controller: twitch,
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Color(0xffE2E1EC), width: 2)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FaIcon(
                      FontAwesomeIcons.twitch,
                      color: const Color(0xff363853),
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Twitter',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: TextField(
              controller: twitter,
              decoration: InputDecoration(
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 2),
                  decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(color: Color(0xffE2E1EC), width: 2)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FaIcon(
                      FontAwesomeIcons.twitter,
                      color: const Color(0xff363853),
                      size: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          /* const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) {},
            ),*/
        ],
      ),
    );
  }
}
