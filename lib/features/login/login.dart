import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weeding_planner/routes.dart';

class Login extends StatelessWidget {
  onSignIn(BuildContext context) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: '',
        password: '',
      );
      Navigator.pushNamed(context, Routes.welcome);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text('Meu Casamento'),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              FlatButton(
                onPressed: () async => await onSignIn(context),
                child: Text('Entrar'),
              ),
              Row(
                children: [
                  Text('Novo usuário ?'),
                  FlatButton(onPressed: () {}, child: Text('Cadastre-se')),
                ],
              ),
              RaisedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.email), Text('Entre com o Goolgle')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
