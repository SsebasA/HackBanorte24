import 'package:com.banorteEduApp.app/courses.dart';
import 'package:com.banorteEduApp.app/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const Color banorteGreyBackground = Color.fromARGB(255, 106, 104, 103);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  int _currentIndex = 0;

  void onTapTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }


  final List<Widget> _pages = [
    ChatScreen(),
    Profile(),
    Courses(),
  ];

  List<String> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _openMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.5, // Ocupa la mitad de la pantalla
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Opción 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Opción 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Opción 3'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: banorteGreyBackground,
      body: Column(
        children: <Widget>[
          // Botón superior
          SizedBox(height: 300),
          GestureDetector(
            onTap: _openMenu,
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(_messages[index]),
                  ),
                );
              },
            ),
          ),
          // Barra inferior para input de texto
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[400],
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
                  color: Colors.white,
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