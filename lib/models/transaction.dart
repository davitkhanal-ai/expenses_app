class Transaction {
  final String category;
  final double amount;
  final bool isIncome;
  final String remarks;
  final String notes;
  final DateTime date;

  Transaction({
    required this.category,
    required this.amount,
    required this.isIncome,
    required this.remarks,
    required this.notes,
    required this.date,
  });
}
