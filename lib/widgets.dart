// ignore_for_file: unreachable_switch_case

import 'package:flutter/material.dart';
import 'package:gestion_contact/login.dart';
import 'package:gestion_contact/account.dart';
import 'package:gestion_contact/groupe.dart';
import 'package:gestion_contact/accueil.dart';


const Color themeColors = Color.fromARGB(255, 70, 166, 175);

bool showPwd(bool showPassword ) => (showPassword == true) ? showPassword = false  : showPassword = true;

AppBar makeAppBar(
  String titre,
  bool? textAlign,
) =>  AppBar(
  title: Text(
    titre, 
    style: const TextStyle(fontSize: 18,)
  ),
  foregroundColor: Colors.white,
  centerTitle: textAlign,
  backgroundColor: themeColors,
);

SizedBox makeSpace(double space ) => SizedBox(height: space,);
SizedBox makeSpaceWidth(double space ) => SizedBox(width: space,);

void navigation(BuildContext context, Widget page){
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page 
    )
  );
}

Drawer makeDrawer(BuildContext context) => Drawer(
  child: Column(
    children: [
      DrawerHeader(child: Column(children: [
        Container(
          height: 112,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/uservert.png"),
              fit: BoxFit.contain
            )  
          ),
        ),
        const Text("Mamadou Oury Baldé")
      ],)),
      TextButton.icon(
        onPressed: () {
          navigation(context, const Login());
        }, 
        icon: const Icon(
          Icons.logout,
          color: Colors.red,
        ), 
        label: const Text(
          "Déconnexion", 
          style: TextStyle(color: Colors.red),
        )
      )
    ],
  ),
);

Card makeGroup(BuildContext context) => Card(
  child: ListTile(
    leading: const Icon(Icons.group),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Amis"),
        SizedBox(
          child: Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
              IconButton(
                onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      icon: Image.asset(
                        "assets/images/delete.png",
                        width: 70,
                        height: 70,
                      ),
                      title: const Text(
                        "Suppression de Contact",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),  
                      ),
                      content: const Text(
                        "Souhaitez-vous Vraiment supprimer cet élément",
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                          child: const Text(
                            "NON",
                            style: TextStyle(
                              color: Colors.red
                            ),
                          )
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          }, 
                          child: const Text(
                            "OUI",
                            style: TextStyle(
                              color: themeColors
                            ),
                          )
                        )
                      ],
                    ),
                  );
                }, 
                icon: const Icon(Icons.delete, color: Colors.red,)
              ),
            ],
          ),
        )
      ],
    ),
  )
);

Card makeContact(BuildContext context) => Card(
  child: ExpansionTile(
    backgroundColor: Colors.white,
    leading: const  Icon(Icons.person),
    title: const Text(
      "Mamadou Oury Balde",
      style: TextStyle(
        fontWeight: FontWeight.bold
      ),
    ),
    subtitle: const Text("623 51 91 22"),
    children: [
      const ListTile(
        leading: Icon(Icons.location_pin),
        title: Text("Mamou, Petel Baly's (Guinée - Conakry)"),
      ),
      const ListTile(
        leading: Icon(Icons.group),
        title: Text("Amis"),
      ),
      const ListTile(
        leading: Icon(Icons.email),
        title: Text("mhbaldedevsecops@gmail.com"),
      ),
      Container(
        height: 1,
        color: themeColors,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.call),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.message),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.edit_square, color: Color.fromARGB(255, 7, 153, 206)),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  icon: Image.asset(
                    "assets/images/delete.png",
                    width: 70,
                    height: 70,
                  ),
                  title: const Text(
                    "Suppression de Contact",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),  
                  ),
                  content: const Text(
                    "Souhaitez-vous Vraiment supprimer cet élément",
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: const Text(
                        "NON",
                        style: TextStyle(
                          color: Colors.red
                        ),
                      )
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: const Text(
                        "OUI",
                        style: TextStyle(
                          color: themeColors
                        ),
                      )
                    )
                  ],
                ),
              );
            }, 
            icon: const Icon(Icons.delete_forever, color: Colors.red),
            iconSize: 30,
          ),
        ],
      )                  
    ], 
  ),
);

BottomNavigationBar makeNavBar(BuildContext context, int index) => BottomNavigationBar( 
  currentIndex: index,
  iconSize: 30,
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.group),label: ""),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: ""),
  ],
  selectedItemColor: themeColors,
  onTap: (value) {
    switch(value) {
      case 0: {
        navigation(context, const Accueil());
      }
      break;
      case 1: {
        navigation(context, const Groupe());
      }
      break;
      case 2: {
        navigation(context, const MyAccount());
      }
      break;
      default:{
        navigation(context, const Accueil());
      }
      break;
    }
  },
);
// BottomNavigationBar makeNavBar(BuildContext context, int index) => BottomNavigationBar(
//   currentIndex: index,
//   iconSize: 30,
//   items: const [
//     BottomNavigationBarItem(icon: Icon(Icons.home),label: "Accueil"),
//     BottomNavigationBarItem(icon: Icon(Icons.group),label: "Mes Groupes"),
//     BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "Mon Compte"),
//   ],
//   onTap: (value) => {

//   },
// );

 