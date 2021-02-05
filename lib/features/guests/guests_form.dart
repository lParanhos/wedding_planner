import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weeding_planner/enums/groomsmens_side.dart';
import 'package:weeding_planner/models/guest.dart';

class GuestsForm extends HookWidget {
  final Function(Guest) onSumit;
  final _formKey = GlobalKey<FormState>();

  GuestsForm(this.onSumit);

  @override
  Widget build(BuildContext context) {
    final guestNameController = useTextEditingController();
    final kidsAgeController = useTextEditingController();
    final isKid = useState(false);
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
                  controller: guestNameController,
                  decoration: InputDecoration(labelText: 'Nome do Convidado:'),
                  validator: (value) => (value.isEmpty || value == null)
                      ? 'Por favor insira o nome do convidado'
                      : null,
                ),
                Row(
                  children: [
                    Text('Criança ?'),
                    Checkbox(
                      value: isKid.value,
                      onChanged: (value) => isKid.value = value,
                    )
                  ],
                ),
                isKid.value
                    ? TextFormField(
                        controller: kidsAgeController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(labelText: 'Idade:'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty || value == null)
                            return 'Por favor insira uma idade válida';

                          if (int.parse(value) > 14)
                            return 'É necessário ter até 14 anos';

                          return null;
                        },
                      )
                    : Container(),
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
                        Guest(
                          id: Random().nextDouble().toString(),
                          name: guestNameController.text,
                          isKid: isKid.value,
                          kidsAge: isKid.value
                              ? int.parse(kidsAgeController.text)
                              : null,
                          side: isBrideSide.value
                              ? GroomsmensSide.bride
                              : GroomsmensSide.groom,
                        ),
                      );
                      Navigator.pop(context);
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
