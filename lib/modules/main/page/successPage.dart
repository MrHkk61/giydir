import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class successPage extends StatelessWidget {
  const successPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Başarılı")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset(
                      "assets/image/successİcon.png",
                      width: 200,
                      height: 200,
                    ),
                  ]),
            ),
            Container(
                padding: const EdgeInsets.all(0.0),
                child: const Align(
                    alignment: Alignment.center,
                    child: Text("Ödeme Başarılı",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xff363853),
                            fontWeight: FontWeight.bold)))),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.all(0.0),
                child: const Align(
                    alignment: Alignment.center,
                    child: Text("Giydir’i tercih ettiğiniz teşekkür ederiz. ",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0xff363853),
                            fontStyle: FontStyle.normal)))),
            const SizedBox(
              height: 50,
            ),
            /*
            RaisedButton(
              shape: RoundedRectangleBorder(
                
                  borderRadius: BorderRadius.circular(10),),
              padding: const EdgeInsets.all(20),
              
              textColor: Colors.white,
              color: const Color.fromRGBO(251, 119, 75, 1),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              child: const Text('Başlayalım'),
            ),*/
          ],
        ),
      ),
    );
  }
}
