import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewWidget extends StatelessWidget {
  const InAppWebViewWidget({
    Key? key,
    required this.url,
    this.onVerifySuccessed,
    this.onLoaded,
  }) : super(key: key);

  final String url;
  final void Function(bool)? onVerifySuccessed;
  final void Function()? onLoaded;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(url)),
      onLoadError: (controller, url, code, message) {
        if (kDebugMode) {
          log('[Webview]'
              'url: $url'
              'code: $code'
              'message: $message'
              '');
        }
      },
      onWebViewCreated: (InAppWebViewController controller) {
        onLoaded?.call();

        // controller.loadUrl(urlRequest: URLRequest(url: Uri.parse(url)));
        // controller.addJavaScriptHandler(
        //     handlerName: 'grecaptchaCallback',
        //     callback: (args) {
        //       // Here you receive all the arguments from the JavaScript side
        //       // that is a List<dynamic>
        //       // print('From the JavaScript side:');
        //       // print(args);
        //       if (args.first is bool) {
        //         onVerify(args.first);
        //       }
        //       return args.reduce((curr, next) => curr + next);
        //     });
      },
      onLoadStop: (controller, url) {},
      onUpdateVisitedHistory: (controller, url, androidIsReload) {
        // log('[InAppWebview][onUpdateVisitedHistory] url: $url');
        // final isSuccess = url?.path.contains('payment/success') ?? false;
        // onVerifySuccessed(isSuccess);
        // if (isSuccess) {
        //   Navigator.of(context).pop(true);
        // }
        // Navigator.of(context).pop(url);
        // if (url?.host.contains('https://sand-payment.9pay.vn') ?? false) {
        //   final result = url?.queryParameters['result'];
        //   return Navigator.of(context).pop(result);
        // }
      },
    );
  }
}
