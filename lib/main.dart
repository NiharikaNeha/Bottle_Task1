import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  Future<bool> _onBackPressed () {

    return showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Do you really want to exit the app?"),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            )
    );
  }
  WebViewController controllerGlobal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'E Acad'
          ),
        ),
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: WebView(
            initialUrl: "https://eacad.org",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              _controller.complete();
            },
          ),
        ),
    );
  }
}
