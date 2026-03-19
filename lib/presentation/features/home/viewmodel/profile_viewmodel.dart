import 'package:demo_banking/data/models/user.dart';
import 'package:demo_banking/data/state/app_state.dart';
import 'package:demo_banking/domain/repository/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileViewmodel extends Notifier<AppState<User>> {
  /// For unit testing, profile provider can be overridden using:
  /// ```dart
  /// ProviderScope(
  ///    overrides: [
  ///       profileRepository.overrideWith((ref) => ProfileRepository),
  ///    ]
  ///  )
  /// ```
  ProfileRepository get profile => ref.read(profileRepository);

  @override
  AppState<User> build() {
    return InitialAppState();
  }

  Future getProfile() async {
    try {
      state = LoadingAppState();
      final user = await profile.getProfile();
      state = SuccessAppState(user);
    } catch (error) {
      state = FailureAppState(error);
    }
  }
}

final profileVm = NotifierProvider<ProfileViewmodel, AppState<User>>(
  () => ProfileViewmodel(),
);
