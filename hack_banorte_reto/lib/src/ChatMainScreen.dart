import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart'; // Importa el paquete correcto

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Inicializar el controlador del WebView
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://flutter.dev')); // Aquí puedes poner tu URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: _controller, // Usa el WebViewController
      ),
    );
  }
}
