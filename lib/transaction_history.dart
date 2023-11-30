import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Transaction Date')),
              DataColumn(label: Text('Funds Out')),
              DataColumn(label: Text('Funds In')),
              DataColumn(label: Text('Balance')),
              DataColumn(label: Text('Description')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('2023-01-01')),
                DataCell(Text('\$20.00')),
                DataCell(Text('\$0.00')),
                DataCell(Text('\$100.00')),
                DataCell(Text('Payment')),
              ]),
              DataRow(cells: [
                DataCell(Text('2023-02-01')),
                DataCell(Text('\$0.00')),
                DataCell(Text('\$30.00')),
                DataCell(Text('\$130.00')),
                DataCell(Text('Deposit')),
              ]),
              DataRow(cells: [
                DataCell(Text('2023-03-01')),
                DataCell(Text('\$15.00')),
                DataCell(Text('\$0.00')),
                DataCell(Text('\$115.00')),
                DataCell(Text('Expense')),
              ]),
              DataRow(cells: [
                DataCell(Text('2023-04-01')),
                DataCell(Text('\$0.00')),
                DataCell(Text('\$25.00')),
                DataCell(Text('\$140.00')),
                DataCell(Text('Refund')),
              ]),
              DataRow(cells: [
                DataCell(Text('2023-05-01')),
                DataCell(Text('\$10.00')),
                DataCell(Text('\$0.00')),
                DataCell(Text('\$130.00')),
                DataCell(Text('Payment')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
