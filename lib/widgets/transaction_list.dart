import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                'No transactions added yet!',
                style: TextStyle(fontSize: 20),
              ),
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transaction = transactions[index];
              return Card(
                child: ListTile(
                  title: Text(transaction.category),
                  subtitle: Text(
                    '${transaction.isIncome ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)} - ${transaction.remarks}\n${transaction.notes}\n${DateFormat('yyyy-MM-dd – kk:mm').format(transaction.date)}',
                  ),
                ),
              );
            },
          );
  }
}
