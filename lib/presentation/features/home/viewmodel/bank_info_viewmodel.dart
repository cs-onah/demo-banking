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

  Future getProfile(String userId) async {
    try {
      state = LoadingAppState();
      final user = await repo.getBankInfo(userId);
      state = SuccessAppState(user);
    } catch (error) {
      state = FailureAppState(error);
    }
  }
}

final bankInfoVm = NotifierProvider<BankInfoViewmodel, AppState<BankInfo>>(
      () => BankInfoViewmodel(),
);
