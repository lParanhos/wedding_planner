import 'package:flutter/material.dart';
import 'package:weeding_planner/models/wedding.dart';
import 'package:weeding_planner/routes.dart';
import 'package:weeding_planner/services/wedding.dart';
import 'package:weeding_planner/widgets/countdown.dart';

class Home extends StatefulWidget {
  final Wedding wedding;

  Home(this.wedding);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Wedding wedding;
  bool loading = true;

  void fetchData() async {
    setState(() {
      loading = true;
    });
    try {
      final result = await WeddingService().getWedding();
      setState(() {
        wedding = result;
      });
    } catch (e) {
      print('Error');
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.wedding == null) {
      fetchData();
      return;
    }

    wedding = widget.wedding;
  }

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
              title: Text('Padrinhos'),
              onTap: () => Navigator.pushNamed(context, Routes.groomsmen),
            ),
            ListTile(
              title: Text('Convidados'),
              onTap: () => Navigator.pushNamed(context, Routes.guests),
            ),
            ListTile(
              title: Text('Fornecedores'),
              onTap: () => Navigator.pushNamed(context, Routes.suppliers),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Countdown(wedding),
          ],
        ),
      ),
    );
  }
}
