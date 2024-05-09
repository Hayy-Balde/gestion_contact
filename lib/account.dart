import 'package:flutter/material.dart';
import 'package:gestion_contact/widgets.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => MyAccountState();
}

class MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar("Mon Compte", false),
      drawer: makeDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 1),
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              color: themeColors,
              height: 200,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/user white.png",
                    width: 150,
                    height: 150,
                  ),
                  const Text(
                    "Mamadou Oury Baldé", 
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold                    
                    ),
                  )
                ]
              ),
              
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: const Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Mamadou Oury Baldé"),
                  ),
                  ListTile(
                    leading: Icon(Icons.work),
                    title: Text("Etudiant"),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text("+224 623 51 91 22"),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("mamadou62351@gmail.com"),
                  ),
                ],
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: makeNavBar(context, 2),
    );
  }
}