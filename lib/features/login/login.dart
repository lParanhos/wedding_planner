import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weeding_planner/routes.dart';
import 'package:weeding_planner/widgets/app_logo.dart';
import 'package:weeding_planner/widgets/custom_text_form_field.dart';
import 'package:weeding_planner/widgets/circular_icon_button.dart';

class Login extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  onSignIn(BuildContext context) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: '',
        password: '',
      );
      Navigator.pushNamedAndRemoveUntil(context, Routes.welcome, (_) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  handleValidate(String value, String errorMessage) {
    if (value.isEmpty) return errorMessage;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: '');
    final passController = useTextEditingController(text: '');

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(18.0),
            children: [
              const AppLogo(),
              CustomTextFormField(
                label: 'E-mail',
                controller: emailController,
                validator: (value) =>
                    handleValidate(value, 'Insira um e-mail valido!'),
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                label: 'Senha',
                controller: passController,
                validator: (value) =>
                    handleValidate(value, 'Insira uma senha valida!'),
              ),
              FlatButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    await onSignIn(context);
                  }
                },
                child: const Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Novo usuário ?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Text(
                      'Cadastre-se',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Ou faça login com',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 12.0),
                  CircularIconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    color: Colors.deepOrange[700],
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
