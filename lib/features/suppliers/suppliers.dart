import 'package:flutter/material.dart';
import 'package:weeding_planner/features/suppliers/suppliers_form.dart';
import 'package:weeding_planner/features/suppliers/suppliers_list.dart';

class Suppliers extends StatelessWidget {
  _showSuppliersForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SuppliersForm();
        },
        isScrollControlled: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fornecedores'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showSuppliersForm(context),
          ),
        ],
      ),
      body: Container(
        child: SuppliersList(),
      ),
    );
  }
}
