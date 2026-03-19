import 'package:demo_banking/core/services/network/api_service.dart';
import 'package:demo_banking/data/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileRepository {
  final ApiService api;
  ProfileRepository(this.api);

  /// Not implemented due to exhausted project/resource limit on mockapi.io
  /// Ideally, userprofile should be fetched using stored auth token
  Future<User> getProfile() async {
    await Future.delayed(Duration(seconds: 3));
    return User(
      id: "bfebe6806defe1569fcd6b2f",
      firstName: "John",
      lastName: "Doe",
      avatar:
          "https://static.vecteezy.com/system/"
          "resources/previews/026/408/485/non_2x/man-lifestyle-portrait-hipster-serious-t-shirt-isolated-person-white-background-american-smile-confident-fashion-photo.jpg",
      walletId: "1",
    );
  }
}

final profileRepository = Provider((ref) {
  final api = ref.read(apiService);
  return ProfileRepository(api);
});
