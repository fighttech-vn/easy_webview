import 'package:easy_loading_adaptive/easy_loading.dart';
import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../html_widget_wrapper.dart';
import '../in_app_web_view_widget.dart';

class WebviewScreen extends StatefulWidget {
  final String? url;
  final String? title;
  final String? htmlContent;

  const WebviewScreen({
    super.key,
    this.url,
    this.title,
    this.htmlContent,
  });

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  var _webviewLoaded = false;

  @override
  Widget build(BuildContext context) {
    final htmlWidget = widget.htmlContent == null
        ? null
        : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: HtmlWidgetWrapper(htmlContent: widget.htmlContent!),
          );

    final html = (widget.title?.isEmpty ?? true)
        ? Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: htmlWidget,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
            ],
          )
        : htmlWidget;
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ImageWidget(
          'https://uploads-ssl.webflow.com/6422d51e1cd9ca2f69414924/6422d51f1cd9ca812b414971_noise_bg.png',
          width: size.width,
          height: size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: (widget.title?.isEmpty ?? true)
              ? null
              : AppBar(
                  title: Text(widget.title!),
                  backgroundColor: Colors.white,
                ),
          body: (widget.htmlContent?.isNotEmpty ?? false)
              ? SafeArea(
                  bottom: false,
                  child: html!,
                )
              : Stack(
                  children: [
                    InAppWebViewWidget(
                      url: widget.url!,
                      onLoaded: () {
                        setState(() {
                          _webviewLoaded = true;
                        });
                      },
                    ),
                    if (!_webviewLoaded)
                      SizedBox(
                        width: size.width,
                        height: size.height,
                        child: LoadingWidgetColor(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}
