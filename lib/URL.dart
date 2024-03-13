import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Webview extends StatefulWidget {
  const Webview({super.key});

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  late final WebViewController controller;
  @override
  void initState(){
   super.initState();
    controller =WebViewController()
   ..loadRequest(Uri.parse(""),
   );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FluterWebView"),

      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
