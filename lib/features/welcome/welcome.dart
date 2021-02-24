import 'package:flutter/material.dart';
import 'package:weeding_planner/features/welcome/welcome_form.dart';
import 'package:weeding_planner/widgets/app_logo.dart';
import 'package:weeding_planner/services/wedding.dart';

class Welcome extends StatelessWidget {
  _submit({String brideName, String groomName, DateTime weedingDay}) async {
    await WeedingService().tryCreateWedding(
        brideName: brideName, groomName: groomName, weedingDay: weedingDay);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Crie seu Casamento',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppLogo(),
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
