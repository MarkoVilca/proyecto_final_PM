import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_pm/pages/login_page.dart';
import 'package:proyecto_final_pm/pages/register_page.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

class HomeStart extends State<Home> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: Scaffold(
          appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 20, top: 150, right: 10),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Boton presionado');
                  Navigator.push(context,MaterialPageRoute(builder: (_)=> Login()));
                },
                child: Text('SOLICITUD'),
              ),
            ),
           ),
           Padding(padding: EdgeInsets.only(left: 20, top: 80, right: 10),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Boton presionado');
                  Navigator.push(context,MaterialPageRoute(builder: (_)=> Register()));
                },
                child: Text('REGISTRO'),
              ),
            ),
           ),
          ],
        ),
      ),
     )
    );
  }
}
