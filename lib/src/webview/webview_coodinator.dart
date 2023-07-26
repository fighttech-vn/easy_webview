import 'package:flutter/material.dart';

import 'widgets/webview_screen.dart';

extension WebviewCoodinator on BuildContext {
  Future<T?> startWebview<T>(
      {String? url, String? title, String? htmlContent}) {
    return Navigator.of(this).push(MaterialPageRoute(
        builder: (context) => WebviewScreen(
              url: url,
              title: title,
              htmlContent: htmlContent,
            )));
  }
}
