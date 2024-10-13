import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DialogflowChat extends StatefulWidget {
  @override
  _DialogflowChatState createState() => _DialogflowChatState();
}

class _DialogflowChatState extends State<DialogflowChat> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Puedes usar esto para mostrar un indicador de progreso
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadHtmlString('''
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="https://www.gstatic.com/dialogflow-console/fast/df-messenger/prod/v1/themes/df-messenger-default.css">
        <script src="https://www.gstatic.com/dialogflow-console/fast/df-messenger/prod/v1/df-messenger.js"></script>
      </head>
      <body style="margin:0; padding:0; overflow:hidden;">
        <df-messenger
          location="us-central1"
          project-id="gcp-banorte-hackaton-team-18"
          agent-id="ee87e5a1-f4fa-4957-9d04-88a6ffc47bd8"
          language-code="en"
          max-query-length="-1">
          <df-messenger-chat chat-title="Agent_know">
          </df-messenger-chat>
        </df-messenger>
        <style>
          df-messenger {
            z-index: 999;
            position: fixed;
            --df-messenger-font-color: #000;
            --df-messenger-font-family: Google Sans;
            --df-messenger-chat-background: #f3f6fc;
            --df-messenger-message-user-background: #d3e3fd;
            --df-messenger-message-bot-background: #fff;
            bottom: 0;
            right: 0;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
          }
        </style>
      </body>
      </html>
      ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialogflow Chat'),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}