import 'package:flutter/material.dart';
import 'package:gestion_contact/account.dart';
// import 'package:gestion_contact/accueil.dart';
import 'package:gestion_contact/groupe.dart';
// import 'package:gestion_contact/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyAccount(),
    );
  }
}