import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
                onPressed: () {},
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
