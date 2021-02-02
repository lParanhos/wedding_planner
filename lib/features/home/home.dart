import 'package:flutter/material.dart';
import 'package:weeding_planner/utils/assets.dart';
import 'package:weeding_planner/widgets/home_info_text.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 160.0,
              child: DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text('Padrinhos'),
            ),
            ListTile(
              onTap: () {},
              title: Text('Convidados'),
            ),
            ListTile(
              onTap: () {},
              title: Text('Fornecedores'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.homeWeddingImage,
              width: 250.0,
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.05,
            ),
            Text(
              'Leandro & Samira',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.02,
            ),
            HomeInfoText(text: 'Faltam 558 dias para o casamento'),
            HomeInfoText(text: '0 convidados e acompanhantes'),
            HomeInfoText(text: '0 de 82 tarefas foram realizadas'),
          ],
        ),
      ),
    );
  }
}
