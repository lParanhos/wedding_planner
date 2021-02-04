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
      //TODO: create id to gromsmens
      Groomsmens(names: 'João & Maria', side: GroomsmensSide.groom),
      Groomsmens(names: 'Carlos & Maria', side: GroomsmensSide.bride),
      Groomsmens(names: 'Cleber & Maria', side: GroomsmensSide.groom),
      Groomsmens(names: 'Bruno & Maria', side: GroomsmensSide.bride),
      Groomsmens(names: 'Jonas & Maria', side: GroomsmensSide.groom),
      Groomsmens(names: 'Pedro & Maria', side: GroomsmensSide.groom),
      Groomsmens(names: 'Lucas & Maria', side: GroomsmensSide.bride),
      Groomsmens(names: 'Ronaldo & Maria', side: GroomsmensSide.groom),
      Groomsmens(names: 'Vitones & Maria', side: GroomsmensSide.groom),
      Groomsmens(names: 'Dunga & Maria', side: GroomsmensSide.bride),
    ]);

    _addGroomsmens(Groomsmens groomsmens) {
      groomsmensList.value = [...groomsmensList.value, groomsmens];
    }

    _deleteGroomsmens(int groomsmensIndex) {
      //TODO: implements delete
      groomsmensList.value.removeAt(groomsmensIndex);
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
              groomsmensList: groomsmensList.value
                  .where((groomsmen) => groomsmen.side == GroomsmensSide.bride)
                  .toList(),
              onDelete: _deleteGroomsmens,
            ),
            GroomsmensList(
              groomsmensList: groomsmensList.value
                  .where((groomsmen) => groomsmen.side == GroomsmensSide.groom)
                  .toList(),
            ),
            GroomsmensList(
              groomsmensList: groomsmensList.value,
              showSide: true,
            ),
          ],
        ),
      ),
    );
  }
}
