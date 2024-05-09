import 'package:flutter/material.dart';
import 'package:gestion_contact/widgets.dart';

class Groupe extends StatefulWidget {
  const Groupe({super.key});

  @override
  State<Groupe> createState() => _GroupeState();
}

class _GroupeState extends State<Groupe> {
   // Variable de connexion
  TextEditingController groupController = TextEditingController();
  final keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar("Mes Groupes", false),
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
                  makeGroup(context),
                  makeGroup(context),
                  makeGroup(context),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){      
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                "AJOUTER UN GROUPE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                height: 70,
                child: Form(
                  key: keyform,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: groupController,
                        decoration:const InputDecoration(
                          label: Text("Groupe"),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.group)
                        ),
                        validator: (value) => value!.isEmpty?"Ce champ est Obligatoire":null
                      ),
                      makeSpace(8),
                    ],
                  ),
                ),
              ),
              actions: [
                Container(
                  padding: const EdgeInsets.all(15),
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Annuler",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Valider",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
              ],
            ),
          );
        },
        backgroundColor:  themeColors,
        child: const Icon(
          Icons.group_add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: makeNavBar(context, 1),
    );
  }
}