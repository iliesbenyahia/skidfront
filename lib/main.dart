import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skidressourcesrel/data/viewmodels/ressourceCard.dart';
import 'package:skidressourcesrel/screens/login.dart';
import 'package:skidressourcesrel/screens/home.dart';
import 'package:skidressourcesrel/screens/ressourceUpload.dart';
import 'package:skidressourcesrel/screens/signup.dart';
import 'package:skidressourcesrel/screens/ressource.dart';
import 'package:skidressourcesrel/screens/ressourcesSearch.dart';
import 'data/viewmodels/ressourceUploadForm.dart';
import 'data/viewmodels/ressourceSearchForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ressourceForm(),
        ),
        ChangeNotifierProvider.value(
          value: ressourceSearchForm(),
        ),
        ChangeNotifierProvider.value(
          value: ressourceCard(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
    initialRoute: '/login',
    routes: {
    '/login' : (context) => const loginScreen(),
    '/home' : (context) => const homeScreen(),
    '/upload' : (context) => const ressourceUpload(),
    '/ressource' : (context) => const ressource(),
    '/searchRessource' : (context) => const ressourcesSearch(),
    '/signup' : (context) => const signUp(),
    },
    theme: ThemeData(
    primarySwatch: Colors.deepPurple,
    primaryColor: Color(0xff544cb4)
    ),
    ));
  }
}

