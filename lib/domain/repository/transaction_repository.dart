import 'package:demo_banking/core/constants/url_config.dart';
import 'package:demo_banking/core/services/network/api_service.dart';
import 'package:demo_banking/data/models/bank_info.dart';
import 'package:demo_banking/data/models/transactions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionRepository {
  final ApiService api;
  TransactionRepository(this.api);

  Future<BankInfo> getBankInfo(String walletId) async {
    final response = await api.call(
      UrlConfig.bankInfo(walletId),
      RequestMethod.get,
      showLog: true,
    );
    return BankInfo.fromJson(response.data);
  }

  Future<List<Transaction>> getTransactions(String userId) async {
    // TODO: scope transactions to userId;
    final response = await api.call(UrlConfig.transactions, RequestMethod.get);
    return List<Transaction>.from(
      response.data.map((x) => Transaction.fromJson(x)),
    );
  }
}

final transactionRepository = Provider((ref) {
  final api = ref.read(apiService);
  return TransactionRepository(api);
});
