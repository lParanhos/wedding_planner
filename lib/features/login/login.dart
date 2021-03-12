import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weeding_planner/models/wedding.dart';
import 'package:weeding_planner/protocol/request_result.dart';
import 'package:weeding_planner/routes.dart';
import 'package:weeding_planner/services/auth.dart';
import 'package:weeding_planner/services/wedding.dart';
import 'package:weeding_planner/widgets/app_logo.dart';
import 'package:weeding_planner/widgets/custom_text_form_field.dart';
import 'package:weeding_planner/widgets/circular_icon_button.dart';

class Login extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  handleAuth({
    Wedding wedding,
    @required String routeName,
    @required BuildContext context,
    @required RequestResult result,
  }) async {
    if (result.statusCode == 200 && wedding != null) {
      Navigator.pushNamedAndRemoveUntil(context, routeName, (_) => false);
      return;
    }

    if (result.statusCode == 200) {
      Navigator.pushNamedAndRemoveUntil(context, routeName, (_) => false);
      return;
    }

    Scaffold.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(result.message),
      ),
    );
  }

  handleValidate(String value, String errorMessage) {
    if (value.isEmpty) return errorMessage;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: '');
    final passController = useTextEditingController(text: '');
    final inviteCodeController = useTextEditingController(text: '');
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final bool hasInviteCode = arguments != null ? arguments['invited'] : false;

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
                if (hasInviteCode) ...[
                  CustomTextFormField(
                    label: 'Código do convite',
                    controller: inviteCodeController,
                    validator: (value) =>
                        handleValidate(value, 'Insira um código valido!'),
                  ),
                  const SizedBox(height: 8.0),
                ],
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
                      final result = await AuthService()
                          .tryLogin(emailController.text, passController.text);

                      final wedding = await WeddingService().getWedding();

                      handleAuth(
                        context: ctx,
                        result: result,
                        wedding: wedding,
                        routeName: Routes.welcome,
                      );
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
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          final result = await AuthService().tryCreateUser(
                              emailController.text, passController.text);

                          handleAuth(
                            context: ctx,
                            result: result,
                            routeName: Routes.welcome,
                          );
                        }
                      },
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
      ),
    );
  }
}
