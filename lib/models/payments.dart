import 'package:flutter/material.dart';
import 'package:weeding_planner/enums/payment_status.dart';

class Payments {
  DateTime date;
  double amount;
  PaymentStatus status;

  Payments({
    @required this.date,
    @required this.amount,
    @required this.status,
  });
}
