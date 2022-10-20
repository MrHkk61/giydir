import 'package:flutter/material.dart';
import 'package:giydir/modules/main/page/cabinetPage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webView extends StatelessWidget {
  final String value;
  const webView({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(value);
    return WebView(
      initialUrl: 'www.$value',
    );
  }
}









/*class webView extends StatefulWidget {
  
  const webView({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  State<webView> createState() => _webViewState();
}

class _webViewState extends State<webView> {
  /*const webView({
    Key? key,
    required this.value,
  }):super(key:key);*/
  final String value;
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://$value',
    );
  }
}*/
