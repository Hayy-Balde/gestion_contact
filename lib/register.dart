import 'package:flutter/material.dart';
import 'package:gestion_contact/login.dart';
import 'package:gestion_contact/widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  bool password = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar("INSCRIVEZ-VOUS", true),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nom complet",
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) => value!.isEmpty?"Ce champ est Obligatoire":null
                  ),
                  makeSpace(10),
                  TextFormField(
                    controller: loginController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Identifiant",
                      prefixIcon: Icon(Icons.account_circle),
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
                    height: 40,
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
                        Image.asset("assets/images/uservert.png",
                          width: 40,
                          height: 40,
                        ),
                        IconButton(
                          onPressed: () {}, 
                          icon: const Icon(Icons.camera_alt)
                        )
                      ],
                    ),
                  ),
                  makeSpace(10),
                  TextFormField(
                    controller: pwdController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Mot de Passe",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(onPressed: (){ setState((){ 
                        password = showPwd(password);
                      });}, icon: const Icon(Icons.remove_red_eye)),
                    ),
                    obscureText: password,
                    validator: (value) => value!.isEmpty?"Ce champ est Obligatoire":null
                  ),
                  makeSpace(20),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(themeColors),
                    ),
                    
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text(
                        "Enregistrer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    )
                  ),
                  makeSpace(15),
                  TextButton(
                    onPressed: (){
                      navigation(context, const Login());
                    }, 
                    child: const Text(
                      "Vous avez deja un compte ? se connecter.", 
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 16
                      ),
                    )
                  )
                ]
              ),
            ),
          )
        ),
      ),
    );
  }
}