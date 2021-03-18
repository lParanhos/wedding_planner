import 'package:flutter/material.dart';
import 'package:weeding_planner/features/welcome/welcome_form.dart';
import 'package:weeding_planner/protocol/request_result.dart';
import 'package:weeding_planner/routes.dart';
import 'package:weeding_planner/widgets/app_logo.dart';
import 'package:weeding_planner/services/wedding.dart';

class Welcome extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  _submit({
    BuildContext context,
    String brideName,
    String groomName,
    DateTime weedingDay,
  }) async {
    RequestResult result = await WeddingService().tryCreateWedding(
        brideName: brideName, groomName: groomName, weddingDay: weedingDay);

    if (result.statusCode == 200) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.home, (route) => false);
      return;
    }

    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(result.message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      key: scaffoldKey,
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
