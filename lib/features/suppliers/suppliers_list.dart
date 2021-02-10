import 'package:flutter/material.dart';
import 'package:weeding_planner/enums/payment_status.dart';
import 'package:weeding_planner/enums/supplies_category.dart';
import 'package:weeding_planner/models/payments.dart';
import 'package:weeding_planner/models/suppliers.dart';
import 'package:weeding_planner/widgets/suppliers_list_tile.dart';

class SuppliersList extends StatelessWidget {
  final List<Supplier> suppliers = [
    Supplier(
      name: 'Family Day',
      category: SuppliesCategory.buffet,
      amount: 1200,
      dueDate: DateTime.now(),
      payments: [
        Payments(date: DateTime.now(), amount: 50, status: PaymentStatus.paid),
        Payments(
            amount: 50,
            date: DateTime.now().add(Duration(days: 20)),
            status: PaymentStatus.waiting),
        Payments(
            amount: 50,
            date: DateTime.now().add(Duration(days: 40)),
            status: PaymentStatus.waiting),
      ],
    ),
    Supplier(
      name: 'DJ',
      category: SuppliesCategory.music,
      amount: 600,
      dueDate: DateTime.now(),
      payments: [],
    ),
    Supplier(
      name: 'Banda',
      category: SuppliesCategory.music,
      amount: 1500,
      dueDate: DateTime.now(),
      payments: [],
    ),
    Supplier(
      name: 'Decoração',
      category: SuppliesCategory.decoration,
      amount: 1000,
      dueDate: DateTime.now(),
      payments: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: suppliers.length,
      itemBuilder: (context, index) =>
          SuppliersListTile(supplier: suppliers[index]),
    );
  }
}
