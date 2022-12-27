import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_pm/pages/data_page.dart';
import 'package:proyecto_final_pm/widgets/general_widget.dart';

class Login extends StatefulWidget {
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  validarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      final usuario = await FirebaseFirestore.instance
          .collection('Users')
          .where("Nombre", isEqualTo: user.text)
          .where("Password", isEqualTo: pass.text)
          .get();
      final bool doesDocExist = usuario.docs.isNotEmpty;
      if (doesDocExist) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Data()));
      } else {
        print('No hay documentos en la collecion');
      }
    } catch (e) {
      print('ERROR...' + e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('INICIA SESION'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/database.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: user,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  labelText: 'Usuario',
                  hintText: 'Digite su Usuario',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  labelText: 'Contraseña',
                  hintText: 'Digite su Contraseña',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 10),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async{
                    validarDatos();
                  },
                  child: Text('INGRESAR'),
                ),
              ),
            ),
          ]),
        ));
  }
}
