import 'package:demo_banking/core/constants/image_path.dart';
import 'package:demo_banking/presentation/features/home/viewmodel/bank_info_viewmodel.dart';
import 'package:demo_banking/presentation/features/home/viewmodel/profile_viewmodel.dart';
import 'package:demo_banking/presentation/features/home/widgets/balance_card.dart';
import 'package:demo_banking/presentation/features/home/widgets/profile_info_section.dart';
import 'package:demo_banking/presentation/features/home/widgets/transaction_tile.dart';
import 'package:demo_banking/presentation/features/transactions/viewmodel/transaction_viewmodel.dart';
import 'package:demo_banking/presentation/shared/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = ref.read(profileVm).getData;
      ref.read(bankInfoVm.notifier).getBankInfo(user?.walletId);
      ref.read(transactionVm.notifier).getTransactions(user?.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePath.homeBg),
          fit: BoxFit.cover,
        ),
        color: context.theme.scaffoldBackgroundColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            children: [
              ProfileInfoSection(),
              const SizedBox(height: 20),
              BalanceCard(),
              const SizedBox(height: 30),
              Text(
                "LAST transactions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
              TransactionTile(),
            ],
          ),
        ),
      ),
    );
  }
}
