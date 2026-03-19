import 'package:demo_banking/data/models/transactions.dart';
import 'package:demo_banking/data/state/app_state.dart';
import 'package:demo_banking/domain/repository/transaction_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionViewmodel extends Notifier<AppState<Transaction>> {
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
  AppState<Transaction> build() {
    return InitialAppState();
  }

  Future getTransactions(String? userId) async {
    try {
      if(userId == null) throw "UserId required";
      state = LoadingAppState();
      final transactions = await repo.getTransactions(userId);
      state = ListAppState(transactions);
    } catch (error) {
      state = FailureAppState(error);
    }
  }
}

final transactionVm =
    NotifierProvider<TransactionViewmodel, AppState<Transaction>>(
      () => TransactionViewmodel(),
    );
