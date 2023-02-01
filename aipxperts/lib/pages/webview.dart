// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
// ignore: unnecessary_import

// ignore: unused_import
import 'package:webview_flutter/webview_flutter.dart';

class webview extends StatelessWidget {
  const webview({Key? key, required String initialUrl, required javascriptMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables, non_constant_identifier_names
    var JavascriptMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
      ),
      body: const webview(
        initialUrl: 'https://www.facebook.com/',
        javascriptMode: null,
      ),
    );
  }
}
