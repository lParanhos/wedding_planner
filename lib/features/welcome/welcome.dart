import 'package:flutter/material.dart';
import 'package:weeding_planner/features/welcome/welcome_form.dart';

class Welcome extends StatelessWidget {
  _submit(String brideName, String groomName, DateTime weedingDay) {
    print('value');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Meu Casamento',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: mediaQuery.size.height * 0.05),
                  Text(
                    'Seja bem vindo !',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.05),
                  WelcomeForm(
                    onSubmit: _submit,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
