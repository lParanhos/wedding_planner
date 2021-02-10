import 'package:flutter/material.dart';
import 'package:weeding_planner/enums/supplies_category.dart';
import 'package:weeding_planner/models/payments.dart';

class Supplier {
  String name;
  double amount;
  DateTime dueDate;
  SuppliesCategory category;
  List<Payments> payments;

  Supplier({
    @required this.name,
    @required this.amount,
    @required this.dueDate,
    @required this.category,
    @required this.payments,
  });
}
