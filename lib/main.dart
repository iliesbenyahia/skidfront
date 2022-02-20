import 'package:flutter/material.dart';
import 'package:skidressourcesrel/screens/login.dart';
import 'package:skidressourcesrel/screens/home.dart';
import 'package:skidressourcesrel/screens/ressourceUpload.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/login',
      routes: {
        '/login' : (context) => const loginScreen(),
        '/home' : (context) => const homeScreen(),
        '/upload' : (context) => const ressourceUpload(),
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple
      ),
    );
  }
}

