import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gestion_contact/widgets.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
 
  List<DropdownMenuItem<String?>>? items = [
    const DropdownMenuItem(value: "Amis",child: Text("Amis")),
    const DropdownMenuItem(value: "Famille",child: Text("Famille")),
    const DropdownMenuItem(value: "Ecole",child: Text("Ecole")),
    const DropdownMenuItem(value: "Autres",child: Text("Autres")),
  ];

  String? genre; 
  String? groupe; 
  File? photo; 

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar("Ajouter Un Contact", false),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nom complet",
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) => value!.isEmpty?"Ce champ est Obligatoire":null,
                  ),
                  makeSpace(10),
                  TextFormField(
                    controller: adresseController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Adresse",
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    validator: (value) => value!.isEmpty?"Ce champ est Obligatoire":null
                  ),
                  makeSpace(10),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Téléphone",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) => value!.isEmpty?"Ce champ est Obligatoire":null
                  ),
                  makeSpace(10),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) => value!.isEmpty?"Ce champ est Obligatoire":null
                  ),
                  
                  makeSpace(10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: const Color.fromARGB(255, 123, 120, 120)
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              const Icon(Icons.female),
                              Radio(
                                value: "Homme", 
                                groupValue: genre, 
                                onChanged: (g) {
                                  setState(() {
                                    genre = g;
                                  });
                                }
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    genre = "Homme";
                                  });
                                },
                                child: const Text("Homme"),
                              )
                            ],
                          ),
                        ),
                        makeSpaceWidth(20),
                        SizedBox(
                          child: Row(
                            children: [
                              Radio(
                                value: "Femme", 
                                groupValue: genre, 
                                onChanged: (g) {
                                  setState(() {
                                    genre = g;
                                  });
                                }
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    genre = "Femme";
                                  });
                                },
                                child: const Text("Femme"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  makeSpace(10),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: const Color.fromARGB(255, 123, 120, 120)
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.group),
                        makeSpaceWidth(10),
                        Expanded(
                          child: DropdownButton(
                            value: groupe,
                            items: items,
                            onChanged: (grp) {
                              setState(() {
                                groupe = grp;
                              });
                            },
                            isExpanded: true,
                            hint: const Text("Selectionner un Groupe"),
                          )
                        )
                      ],
                    ),
                  ),
                  makeSpace(10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: const Color.fromARGB(255, 123, 120, 120)
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        photo == null ? const Icon(Icons.image) : Image.file(photo!, width: 50, height: 50),
                        IconButton(
                          onPressed: () {}, 
                          icon: const Icon(Icons.camera_alt)
                        )
                      ],
                    ),
                  ),
        
        
        
        
                  makeSpace(20),
                  ElevatedButton(
                    onPressed: () {
                      
                      if(formKey.currentState!.validate()){
                        print("On enregistre");
                      }
                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(themeColors),
                    ),
                    
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: Text(
                        "Enregistrer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                    )
                  ),
                ]
              ),
            ),
          )
        ),
      ),
      bottomNavigationBar: makeNavBar(context, 0),
    );
  }

  
}