import 'package:demo_banking/core/constants/url_config.dart';
import 'package:demo_banking/core/services/network/api_service.dart';
import 'package:demo_banking/data/models/bank_info.dart';
import 'package:demo_banking/data/models/transactions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionRepository {
  final ApiService api;
  TransactionRepository(this.api);

  // userId: bfebe6806defe1569fcd6b2f
  Future<BankInfo> getBankInfo(String userId) async {
    final response = await api.call(UrlConfig.bankInfo, RequestMethod.get);
    return BankInfo.fromJson(response.data);
  }

  // userId: aedb5da001f9f6e17631ad6b
  Future<List<Transaction>> getTransactions(String userId) async {
    final response = await api.call(UrlConfig.bankInfo, RequestMethod.get);
    return List<Transaction>.from(
      response.data.map((x) => Transaction.fromJson(x)),
    );
  }
}

final transactionRepository = Provider((ref) {
  final api = ref.read(apiService);
  return TransactionRepository(api);
});
