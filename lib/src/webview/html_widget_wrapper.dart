import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class HtmlWidgetWrapper extends StatelessWidget {
  const HtmlWidgetWrapper({
    super.key,
    required this.htmlContent,
    this.textStyle,
    this.onTapUrl,
  });

  final String htmlContent;
  final TextStyle? textStyle;
  final FutureOr<bool> Function(String)? onTapUrl;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      htmlContent,
      onTapUrl: onTapUrl,
      textStyle: textStyle,
    );
  }
}
