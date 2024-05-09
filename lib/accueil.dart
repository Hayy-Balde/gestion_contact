import 'package:flutter/material.dart';
import 'package:gestion_contact/addcontact.dart';
import 'package:gestion_contact/widgets.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar("Mes Contacts", false),
      drawer: makeDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 70,
              color: const Color.fromARGB(255, 230, 230, 230),
              child:  TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,  
                  ),
                  hintText: "Rechercher",
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                  makeContact(context),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, 
            MaterialPageRoute(builder: (context)=> const Contact())
          );
        },
        backgroundColor:  themeColors,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: makeNavBar(context, 0),
    );
  }
}