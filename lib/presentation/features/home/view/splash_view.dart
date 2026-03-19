import 'package:demo_banking/data/models/user.dart';
import 'package:demo_banking/data/state/app_state.dart';
import 'package:demo_banking/presentation/features/home/view/nav_view.dart';
import 'package:demo_banking/presentation/features/home/viewmodel/profile_viewmodel.dart';
import 'package:demo_banking/presentation/shared/utils/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This view initializes the user profile since profile information is not being cached
class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});
  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileVm.notifier).getProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(profileVm, (_, state) {
      if (state is SuccessAppState<User>) {
        context.push(NavView());
      }
    });
    final profile = ref.watch(profileVm);
    return Scaffold(
      body: switch (profile) {
        FailureAppState() => Column(
          children: [
            Row(),
            Spacer(),
            Text(
              "Failed to fetch profile",
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: ref.read(profileVm.notifier).getProfile,
              child: Text("Retry"),
            ),
            Spacer(),
          ],
        ),
        _ => Column(
          children: [
            Row(),
            Spacer(),
            Text(
              "Bank App Demo",
              style: TextStyle(
                color: context.theme.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CupertinoActivityIndicator(),
            Spacer(),
          ],
        ),
      },
    );
  }
}
