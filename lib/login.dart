import 'package:flutter/material.dart';
import 'package:gestion_contact/register.dart';
import 'package:gestion_contact/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Variable de connexion
  TextEditingController loginController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  final keyform = GlobalKey<FormState>();

  // Variable de changement de mot de passe
  TextEditingController editPwdLoginContoller = TextEditingController();
  TextEditingController editPwdController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();
  final keyEditpwd = GlobalKey<FormState>();

  bool showPassword = true;
  bool showPassword2 = true;
  bool showPassword3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar("Page de Connexion", true),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/uservert.png',
                width: 200,
                height: 200,
              ),
              makeSpace(10),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: loginController,
                        decoration:const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          hintText: "Identifiant",
                        ),
                      ),
                      makeSpace(8),
                      TextFormField(
                        controller: pwdController,     
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(onPressed: (){ setState((){ 
                            showPassword = showPwd(showPassword);
                          });}, icon: const Icon(Icons.remove_red_eye)),
                          hintText: "Mot de passe",
                        ),
                        obscureText: showPassword,
                      ),
                      makeSpace(4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: (){
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    "REINITIALISEZ LE MOT DE PASSE",
                                    style: TextStyle(
                                      fontSize: 16
                                    ),
                                  ),
                                  content: SizedBox(
                                    height: 193,
                                    child: Form(
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: editPwdLoginContoller,
                                            decoration:const InputDecoration(
                                              label: Text("Identifiant"),
                                              border: OutlineInputBorder(),
                                              prefixIcon: Icon(Icons.person)
                                            ),
                                          ),
                                          makeSpace(8),
                                          TextField(
                                            controller: editPwdController,
                                            decoration:  InputDecoration(
                                              label: const Text("Nouveau Mot de Passe"),
                                              border: const OutlineInputBorder(),
                                              prefixIcon: const Icon(Icons.password),
                                              suffixIcon: IconButton(onPressed: (){ setState((){ 
                                                showPassword2 = showPwd(showPassword2);
                                              });}, icon: const Icon(Icons.remove_red_eye)),
                                            ),
                                            obscureText: showPassword2,
                                          ),
                                          makeSpace(8),
                                          TextField(
                                            controller: confirmPwdController,
                                            decoration:  InputDecoration(
                                              label: const Text("Comfirmer le Mot de Passe"),
                                              border: const OutlineInputBorder(),
                                              prefixIcon: const Icon(Icons.password),
                                              suffixIcon: IconButton(onPressed: (){ setState((){ 
                                                showPassword3 = showPwd(showPassword3);
                                              });}, icon: const Icon(Icons.remove_red_eye)),
                                            ),
                                            obscureText: showPassword3
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
                            child: const Text('Mot de passe oublié ?', style: TextStyle(
                              color: Colors.red
                            ),)
                          )
                        ],
                      ),
                      makeSpace(8),
                      ElevatedButton(
                        onPressed: () {}, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(themeColors),
                        ),
                        
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          child: Text(
                            "Connexion",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),
                          ),
                        )
                      ),
                      makeSpace(8),
                      TextButton(
                        onPressed: (){
                          navigation(context, const Register());
                        }, 
                        child: const Text(
                          "Vous n'avez pas de compte ? créez-en.", 
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16
                          ),
                        )
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}