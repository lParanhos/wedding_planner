import 'package:flutter/material.dart';

class SuppliersForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 16.0),
      child: Form(
        child: ListView(
          children: [
            Text('Adicionar novo fornecedor'),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Valor'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Categoria'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Data Para pagamento'),
            ),
          ],
        ),
      ),
    );
  }
}
