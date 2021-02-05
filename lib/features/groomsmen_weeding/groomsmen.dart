import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weeding_planner/enums/groomsmens_side.dart';
import 'package:weeding_planner/features/groomsmen_weeding/groomsmen_form.dart';
import 'package:weeding_planner/features/groomsmen_weeding/groomsmen_list.dart';
import 'package:weeding_planner/models/groomsmens.dart';

class Groomsmen extends HookWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();

  _openAddGroomsMensFormModal(BuildContext context, Function add) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return GroomsmensForm(add);
        });
  }

  @override
  Widget build(BuildContext context) {
    final groomsmensList = useState<List<Groomsmens>>([
      Groomsmens(
          id: Random().nextDouble().toString(),
          names: 'João & Maria',
          side: GroomsmensSide.groom),
      Groomsmens(
          id: Random().nextDouble().toString(),
          names: 'Carlos & Maria',
          side: GroomsmensSide.bride),
      Groomsmens(
          id: Random().nextDouble().toString(),
          names: 'Cleber & Maria',
          side: GroomsmensSide.groom),
      Groomsmens(
          id: Random().nextDouble().toString(),
          names: 'Bruno & Maria',
          side: GroomsmensSide.bride),
      Groomsmens(
          id: Random().nextDouble().toString(),
          names: 'Jonas & Maria',
          side: GroomsmensSide.groom),
      Groomsmens(
          id: Random().nextDouble().toString(),
          names: 'Pedro & Maria',
          side: GroomsmensSide.groom),
      Groomsmens(
          id: Random().nextDouble().toString(),
          names: 'Lucas & Maria',
          side: GroomsmensSide.bride),
      Groomsmens(
          id: Random().nextDouble().toString(),
          names: 'Ronaldo & Maria',
          side: GroomsmensSide.groom),
      Groomsmens(
          id: Random().nextDouble().toString(),
          names: 'Vitones & Maria',
          side: GroomsmensSide.groom),
      Groomsmens(
          id: Random().nextDouble().toString(),
          names: 'Dunga & Maria',
          side: GroomsmensSide.bride),
    ]);

    _addGroomsmens(Groomsmens groomsmens) {
      groomsmensList.value = [...groomsmensList.value, groomsmens];
    }

    _deleteGroomsmens(String id) {
      groomsmensList.value.removeWhere((groomsmen) => groomsmen.id == id);
      groomsmensList.value = List.from(groomsmensList.value);
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          title: Text('Padrinhos'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Da Noiva'),
              Tab(text: 'Do Noivo'),
              Tab(text: 'Todos'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.group_add),
              onPressed: () =>
                  _openAddGroomsMensFormModal(context, _addGroomsmens),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            GroomsmensList(
              onDelete: _deleteGroomsmens,
              groomsmensList: groomsmensList.value
                  .where((groomsmen) => groomsmen.side == GroomsmensSide.bride)
                  .toList(),
            ),
            GroomsmensList(
              onDelete: _deleteGroomsmens,
              groomsmensList: groomsmensList.value
                  .where((groomsmen) => groomsmen.side == GroomsmensSide.groom)
                  .toList(),
            ),
            GroomsmensList(
              showSide: true,
              onDelete: _deleteGroomsmens,
              groomsmensList: groomsmensList.value,
            ),
          ],
        ),
      ),
    );
  }
}
