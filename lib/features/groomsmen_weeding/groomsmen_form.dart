import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weeding_planner/enums/groomsmens_side.dart';
import 'package:weeding_planner/models/groomsmens.dart';

class GroomsmensForm extends HookWidget {
  final Function(Groomsmens) onSumit;
  final _formKey = GlobalKey<FormState>();

  GroomsmensForm(this.onSumit);

  @override
  Widget build(BuildContext context) {
    final bestManController = useTextEditingController();
    final maidOfHonorController = useTextEditingController();
    final isBrideSide = useState(false);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: bestManController,
                  decoration: InputDecoration(labelText: 'Nome do Padrinho:'),
                  validator: (value) => (value.isEmpty || value == null)
                      ? 'Por favor insira o nome do Padrinho'
                      : null,
                ),
                TextFormField(
                  controller: maidOfHonorController,
                  decoration: InputDecoration(labelText: 'Nome da Madrinha:'),
                  validator: (value) => (value.isEmpty || value == null)
                      ? 'Por favor insira o nome da Madrinha'
                      : null,
                ),
                Row(
                  children: [
                    Text('Noivo'),
                    Switch(
                      value: isBrideSide.value,
                      onChanged: (value) => isBrideSide.value = value,
                    ),
                    Text('Noiva')
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      onSumit(
                        Groomsmens(
                          names:
                              '${bestManController.text} & ${maidOfHonorController.text}',
                          side: isBrideSide.value
                              ? GroomsmensSide.bride
                              : GroomsmensSide.groom,
                        ),
                      );
                    }
                  },
                  child: Text('Adicionar'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
