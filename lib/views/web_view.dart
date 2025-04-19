import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String? url;
  const WebView({super.key, required this.url});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final Uri _initialUrl;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _initialUrl = Uri.parse(widget.url!);
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(_initialUrl);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: WebViewWidget(controller: _controller),
    );
  }
}

