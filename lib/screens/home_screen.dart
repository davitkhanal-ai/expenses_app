import 'package:flutter/material.dart';

// import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../widgets/transaction_list.dart';
import 'add_transaction_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Transaction> _transactions = [];
  double _totalBalance = 0.0;

  void _addTransaction(Transaction transaction) {
    setState(() {
      _transactions.add(transaction);
      _totalBalance +=
          transaction.isIncome ? transaction.amount : -transaction.amount;
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return AddTransactionScreen(_addTransaction);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Total Balance: \$${_totalBalance.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: TransactionList(_transactions),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
