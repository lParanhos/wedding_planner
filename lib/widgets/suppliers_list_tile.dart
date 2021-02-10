import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weeding_planner/enums/payment_status.dart';
import 'package:weeding_planner/models/suppliers.dart';

class SuppliersListTile extends StatelessWidget {
  final Supplier supplier;

  SuppliersListTile({@required this.supplier});

  String get parcelsLabel {
    int amountPayeds = supplier.payments
        .where((payment) => payment.status == PaymentStatus.paid)
        .length;

    return '$amountPayeds/${supplier.payments.length}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(supplier.name),
            Text(
              NumberFormat.currency(locale: 'pt', symbol: 'R\$')
                  .format(supplier.amount),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(supplier.category.toString()),
            if (supplier.payments.length > 0) Text('Parcelas: $parcelsLabel'),
          ],
        ),
      ),
    );
  }
}
