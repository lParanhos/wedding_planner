import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weeding_planner/routes.dart';
import 'package:weeding_planner/widgets/app_logo.dart';
import 'package:weeding_planner/widgets/custom_raised_button.dart';

class Onboarding extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Builder(
        builder: (ctx) => SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const AppLogo(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                CustomRaisedButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.login),
                  width: 200.0,
                  text: 'Criar um casamento',
                ),
                CustomRaisedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(Routes.login, arguments: {'invited': true}),
                  width: 200.0,
                  text: 'Entrar em um casamento',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui conta ?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          Navigator.of(context).pushNamed(Routes.login),
                      child: const Text(
                        'Entre',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
