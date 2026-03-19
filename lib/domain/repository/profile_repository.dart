import 'package:demo_banking/core/services/network/api_service.dart';
import 'package:demo_banking/data/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileRepository {
  final ApiService api;
  ProfileRepository(this.api);

  /// Not implemented due to exhausted project/resource limit on mockapi.io
  Future<User> getProfile() async {
    await Future.delayed(Duration(seconds: 3));
    return User(
      id: "1",
      firstName: "John",
      lastName: "Doe",
      avatar:
          "https://static.vecteezy.com/system/"
          "resources/previews/026/408/485/non_2x/man-lifestyle-portrait-hipster-serious-t-shirt-isolated-person-white-background-american-smile-confident-fashion-photo.jpg",
    );
  }
}

final profileRepository = Provider((ref) {
  final api = ref.read(apiService);
  return ProfileRepository(api);
});
