import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _hasSentMessage = false;
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    // Inicializa WebView si es necesario en dispositivos específicos
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
        _hasSentMessage = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Cambia el color de fondo según lo necesites
      body: Column(
        children: <Widget>[
          if (!_hasSentMessage) ...[
            SizedBox(height: 300),
            Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/logo.png"),
            ),
          ],
          Expanded(
            // Reemplaza la lista de mensajes con el WebView de Dialogflow
            child: WebView(
              initialUrl: Uri.dataFromString('''
                <!DOCTYPE html>
                <html lang="en">
                <head>
                  <meta charset="UTF-8">
                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <link rel="stylesheet" href="https://www.gstatic.com/dialogflow-console/fast/df-messenger/prod/v1/themes/df-messenger-default.css">
                  <script src="https://www.gstatic.com/dialogflow-console/fast/df-messenger/prod/v1/df-messenger.js"></script>
                </head>
                <body>
                  <df-messenger
                    oauth-client-id="INSERT_OAUTH_CLIENT_ID"
                    location="us-central1"
                    project-id="gcp-banorte-hackaton-team-18"
                    agent-id="ee87e5a1-f4fa-4957-9d04-88a6ffc47bd8"
                    language-code="en"
                    max-query-length="-1">
                  </df-messenger>
                </body>
                </html>
              ''', mimeType: 'text/html').toString(),
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: 'Ask Me anything...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.blue, // Cambia el color del ícono según lo necesites
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
