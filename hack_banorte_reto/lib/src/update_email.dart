import 'package:com.banorteEduApp.app/main.dart';
import 'package:com.banorteEduApp.app/src/login.dart';
import 'package:com.banorteEduApp.app/src/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';





class UpdatePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Actualizar email',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: UpdateEmailPage(),
    );
  }
}

class UpdateEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body:
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 110,
              decoration: BoxDecoration(
                color: banorteRed,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(300),
                  bottomRight: Radius.circular(300),
                ),
              ),
              child: Center(
                child: Text("Actualizar correo eletrónico",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Gotham'
                  )),
              ),
            ),
            SizedBox(height: 50,),
            
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Ingrese correo anterior",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),),
              ),
        
            ),
            
            SizedBox(height: 20,),
            Container(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.0), child: 
                TextField(
                decoration: InputDecoration(
                  hintText: "Email anterior",
                  hintStyle: TextStyle(
                    fontFamily: 'Gotham', // Asegúrate de agregar la fuente en tu proyecto
                    fontSize: 12,
                    color: Color(0xFF5B6670),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xFF5B6670)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      // Acción para limpiar el campo
                    },
                  ),
                ),
      ),
            ),
            ),
            SizedBox(height:20),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Ingrese el nuevo correo",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),),
              ),
        
            ),
            
            SizedBox(height: 20,),
            Container(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 20.0), child:  
                
                TextField(
                decoration: InputDecoration(
                  hintText: "Email nuevo",
                  hintStyle: TextStyle(
                    fontFamily: 'Gotham', // Asegúrate de agregar la fuente en tu proyecto
                    fontSize: 12,
                    color: Color(0xFF5B6670),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Color(0xFF5B6670)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      // Acción para limpiar el campo
                    },
                  ),
                ),
      ),
            ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
            onPressed: () {

            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: banorteGreen,
              foregroundColor: Colors.white
            ),
            child: Text("Actualizar")),
            SizedBox(height: 50,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage())
              );
            }, 
            style: ElevatedButton.styleFrom(
              backgroundColor: banorteRed,
              foregroundColor: Colors.white
            ),
            child: Text("Regresar"))  
          ]
        )
    );
  }
}