import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final String email;
  RegisterPage({Key key, this.email}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  createAccount() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email, password: "Dr.Soler7788");
  }

  Widget textbox(String description) {
    return TextFormField(
      decoration: InputDecoration(hintText: description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dr. Soler"),
        ),
        body: Center(
          child: Form(
              child: SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                      "Hola! Para poder programar tu cita necesitamos saber un poco mas de ti"),
                ),
                Divider(),
                textbox("nombre"),
                textbox("apellido"),
                textbox("telefono"),
                textbox("sexo"),
                textbox("fecha de nacimiento"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        print("Muy bien! Crear cuenta");
                      },
                      child: Text("Enviar")),
                )
              ],
            ),
          )),
        ));
  }
}
