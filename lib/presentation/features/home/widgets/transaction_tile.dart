import 'package:demo_banking/data/models/transactions.dart';
import 'package:demo_banking/presentation/shared/utils/context_extension.dart';
import 'package:demo_banking/presentation/shared/utils/datetime_extension.dart';
import 'package:demo_banking/presentation/shared/utils/number_util.dart';
import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final Transaction? transaction;
  const TransactionTile({super.key, this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: context.theme.cardColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction?.name ?? "Transaction name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  transaction?.transactionDate?.fullFormat ?? "Date",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "\$${NumberUtil.formatNumber(transaction?.amount) ?? '--'}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
