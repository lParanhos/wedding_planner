import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weeding_planner/routes.dart';
import 'package:weeding_planner/services/auth.dart';
import 'package:weeding_planner/widgets/app_logo.dart';
import 'package:weeding_planner/widgets/custom_text_form_field.dart';

class Join extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  onSignIn({
    @required BuildContext context,
    @required String email,
    @required String password,
  }) async {
    try {
      final result = await AuthService().tryLogin(email, password);
      if (result.statusCode == 200) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.welcome, (_) => false);
        return;
      }

      Scaffold.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(result.message),
        ),
      );

      print('Falhou');
    } catch (e) {
      print('ERROR');
      print(e);
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
      body: Builder(
        builder: (ctx) => SafeArea(
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
                      await onSignIn(
                        context: ctx,
                        email: emailController.text,
                        password: passController.text,
                      );
                    }
                  },
                  child: const Text(
                    'Salvar',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
