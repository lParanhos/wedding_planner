import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class WelcomeForm extends HookWidget {
  final Function(String, String, DateTime) onSubmit;

  WelcomeForm({this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final brideNameController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final groomNameController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final selectedDate = useState<DateTime>();
    final formKey = GlobalKey<FormState>();

    final mediaQuery = MediaQuery.of(context);

    _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 10),
      ).then((pickedDate) {
        if (pickedDate == null) {
          return null;
        }

        selectedDate.value = pickedDate;
      });
    }

    submit() {
      if (!formKey.currentState.validate() || selectedDate == null) {
        return null;
      }

      onSubmit(brideNameController.text, groomNameController.text,
          selectedDate.value);
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: brideNameController,
            validator: (value) =>
                value.isEmpty ? 'Insira o nome da noiva' : null,
            decoration: InputDecoration(labelText: 'Nome da Noiva'),
          ),
          SizedBox(height: mediaQuery.size.height * 0.01),
          TextFormField(
            controller: groomNameController,
            validator: (value) =>
                value.isEmpty ? 'Insira o nome do noivo' : null,
            decoration: InputDecoration(labelText: 'Nome do Noivo'),
          ),
          SizedBox(height: mediaQuery.size.height * 0.01),
          Row(
            children: [
              Expanded(
                child: Text(selectedDate.value == null
                    ? 'Nenhuma Data Selecionada!'
                    : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate.value)}'),
              ),
              FlatButton(
                onPressed: _showDatePicker,
                textColor: Theme.of(context).primaryColor,
                child: Text('Selecionar Data'),
              )
            ],
          ),
          RaisedButton(
            onPressed: submit,
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
            child: Text(
              'Continuar',
            ),
          ),
        ],
      ),
    );
  }
}
