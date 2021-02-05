import 'package:flutter/material.dart';

class SuppliersList extends StatelessWidget {
  final suppliers = [
    {
      'name': 'Family Day',
      'category': 'Buffet',
      'amount': 1200,
      'dueDate': DateTime.now(),
      'payments': [
        {'date': DateTime.now(), 'amount': 50, 'status': 'paid'},
        {
          'date': DateTime.now().add(Duration(days: 20)),
          'amount': 50,
          'status': 'waiting'
        },
        {
          'date': DateTime.now().add(Duration(days: 40)),
          'amount': 50,
          'status': 'waiting'
        },
      ]
    },
    {
      'name': 'Family Mingaa',
      'category': 'Buffet',
      'amount': 1300,
      'dueDate': DateTime.now()
    },
    {
      'name': 'Family Daasdasday',
      'category': 'Buffet',
      'amount': 1400,
      'dueDate': DateTime.now()
    },
    {
      'name': 'Family Daaaaaaaaaay',
      'category': 'Buffet',
      'amount': 200,
      'dueDate': DateTime.now()
    },
    {
      'name': 'DJ',
      'category': 'music',
      'amount': 600,
      'dueDate': DateTime.now()
    },
    {
      'name': 'Banda',
      'category': 'music',
      'amount': 1500,
      'dueDate': DateTime.now()
    },
    {
      'name': 'Decoração',
      'category': 'decoration',
      'amount': 1000,
      'dueDate': DateTime.now()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: suppliers.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(suppliers[index]['name']),
                Text(suppliers[index]['amount'].toString()),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(suppliers[index]['category']),
                Text('Parcelas: 1/1'),
              ],
            ),
          ),
        );
      },
    );
  }
}
