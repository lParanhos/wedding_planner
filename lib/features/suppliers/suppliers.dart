import 'package:flutter/material.dart';
import 'package:weeding_planner/features/suppliers/suppliers_list.dart';

class Suppliers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fornecedores'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: SuppliersList(),
      ),
    );
  }
}
