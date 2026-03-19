import 'package:demo_banking/data/state/app_state.dart';
import 'package:demo_banking/presentation/features/home/viewmodel/bank_info_viewmodel.dart';
import 'package:demo_banking/presentation/shared/utils/context_extension.dart';
import 'package:demo_banking/presentation/shared/utils/datetime_extension.dart';
import 'package:demo_banking/presentation/shared/utils/number_util.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BalanceCard extends ConsumerWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankInfo = ref.watch(bankInfoVm);
    return switch (bankInfo) {
      LoadingAppState() => FadeShimmer(
        width: double.infinity,
        radius: 16,
        height: 200,
        fadeTheme: FadeTheme.light,
      ),
      SuccessAppState() => Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Current Balance", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 12),
                  Text(
                    "\$1${NumberUtil.formatNumber(bankInfo.data.balance) ?? '--'}",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),

            // bottom section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                gradient: context.gradient,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    NumberUtil.formatCardNumber(bankInfo.data.cardNumber) ??
                        "N/A",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    bankInfo.data.expiryDate.expiryFormat ?? 'dd/YYYY',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      _ => SizedBox.shrink(),
    };
  }
}
