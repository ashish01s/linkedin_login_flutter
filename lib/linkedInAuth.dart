import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LinkedInAuth extends StatefulWidget {
  final clientId;
  final callBackUrl;
  final scope;

  const LinkedInAuth(
      {Key key,
      this.clientId,
      this.callBackUrl,
      this.scope = "r_liteprofile%20r_emailaddress"})
      : super(key: key);

  @override
  _LinkedInAuthState createState() => _LinkedInAuthState();
}

class _LinkedInAuthState extends State<LinkedInAuth> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinkedIn Login'),
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl:
              'https://www.linkedin.com/oauth/v2/authorization?response_type=code&client_id=${widget.clientId}&redirect_uri=${widget.callBackUrl}&scope=${widget.scope}',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          onPageStarted: (String url) {
            if (url.startsWith(widget.callBackUrl)) {
              Navigator.pop(
                context,
                url.toString().substring(url.indexOf("=") + 1),
              );
            }
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }
}
