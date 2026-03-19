import 'package:demo_banking/data/models/transactions.dart';
import 'package:demo_banking/presentation/shared/utils/datetime_extension.dart';
import 'package:demo_banking/presentation/shared/utils/number_util.dart';
import 'package:flutter/material.dart';

class TransactionDetailsView extends StatelessWidget {
  final Transaction? transaction;
  const TransactionDetailsView({super.key, this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transaction Details")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        children: [
          row(icon: Icons.tag, title: "Transaction ID", value: transaction?.id),
          row(icon: Icons.category, title: "Transaction Name", value: transaction?.name),
          row(
            icon: Icons.paid,
            title: "Amount",
            value: NumberUtil.formatNumber(transaction?.amount) ?? 'NA',
          ),
          row(
            icon: Icons.category,
            title: "Transaction Date",
            value: transaction?.transactionDate?.fullFormat,
          ),
        ],
      ),
    );
  }

  Widget row({IconData? icon, String? title, String? value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 12),
          Text(
            title ?? "Title",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 30),
          const Spacer(),
          Expanded(child: Text(value ?? "Value", textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}
