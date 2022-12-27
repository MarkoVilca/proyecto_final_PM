import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  // CollectionReference tasksReference = FirebaseFirestore.instance.collection('Users');
  @override
  RegisterApp createState() => RegisterApp();
}

class RegisterApp extends State<Register> {
  TextEditingController usuario = TextEditingController();
  TextEditingController doc = TextEditingController();
  TextEditingController pass =TextEditingController();
  final firebase = FirebaseFirestore.instance;

  registroUsuario()async{
    try{
      await firebase.collection('Users').doc().set({
        "Nombre": usuario.text,
        "Cuenta": doc.text,
        "Password": pass.text,
      });
    } catch (e) {
      print('ERROR....'+ e.toString());
    }    
}
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de cuenta personal'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 50, right: 10),
            child: TextField(
              controller: usuario,
              decoration: InputDecoration(
                  labelText: 'Usuario',
                  hintText: 'Digite nombre de usuario',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 15, right: 10),
            child: TextField(
              controller: doc,
              decoration: InputDecoration(
                  labelText: 'Cuenta',
                  hintText: 'Digite tipo de cuenta',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 15, right: 10),
            child: TextField(
              controller: pass,
              decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Digite su Contraseña',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
             print('Enviado...');
             registroUsuario();
             usuario.clear();
             doc.clear();
             pass.clear();
            },

            child: Text('Enviar'),
          ),
          )
        ],
      )),
    );
  }
}
