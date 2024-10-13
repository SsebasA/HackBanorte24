import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:com.banorteEduApp.app/login.dart';


void main() {
  runApp(MyApp());
}

const Color banorteRed = Color.fromARGB(255, 236, 0, 41);


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Perfil',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: banorteRed,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(300),
                bottomRight: Radius.circular(300),
              ),
            ),
            child: Center(
              child:Text("Tu Perfil",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )),
            ),
          ),
          SizedBox(height: 40),
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey,
                )
              ),
              SizedBox(height: 20,),
              TextButton(onPressed: () {

              }, 
              child: Text("Cambiar imagen"),
              style: TextButton.styleFrom(
                foregroundColor: banorteRed,
              )),  
              Text("Nombre del usuario",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
            child:
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Configuración del perfil",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,  
                      
                    ),
                    textAlign: TextAlign.left,
                    
              ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
            child:
              Container(
                alignment: Alignment.centerLeft,
                child: 
                  TextButton(
                    onPressed: () {}, 
                    child: Text("Actualizar correo"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),),    
              ),
            ),
            SizedBox(height: 10,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                child:
                  Container(
                    alignment: Alignment.centerLeft,
                    child:
                      TextButton(
                        onPressed: () {}, 
                        child: Text("Actualizar contraseña"),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                        )),
                  )
              
              ),
              

            ],
          ),
          SizedBox(height: 40,),
          Container(
            child:
            ElevatedButton(
              onPressed: () {}, 
              child: Text("Cerrar sesión"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: banorteRed
              )),
          )
                 
        ],
      )
    );
  }
}
