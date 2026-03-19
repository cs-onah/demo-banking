import 'package:demo_banking/data/models/bank_info.dart';
import 'package:demo_banking/data/state/app_state.dart';
import 'package:demo_banking/domain/repository/transaction_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BankInfoViewmodel extends Notifier<AppState<BankInfo>> {
  /// For unit testing, profile provider can be overridden using:
  /// ```dart
  /// ProviderScope(
  ///    overrides: [
  ///       transactionRepository.overrideWith((ref) => TransactionRepository),
  ///    ]
  ///  )
  /// ```
  TransactionRepository get repo => ref.read(transactionRepository);

  @override
  AppState<BankInfo> build() {
    return InitialAppState();
  }

  Future getBankInfo(String? walletId) async {
    try {
      if(walletId == null) throw "WalletId required";
      state = LoadingAppState();
      final user = await repo.getBankInfo(walletId);
      state = SuccessAppState(user);
    } catch (error) {
      state = FailureAppState(error);
    }
  }
}

final bankInfoVm = NotifierProvider<BankInfoViewmodel, AppState<BankInfo>>(
      () => BankInfoViewmodel(),
);
