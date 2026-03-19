import 'package:demo_banking/presentation/features/home/view/home_view.dart';
import 'package:demo_banking/presentation/features/home/widgets/app_bottom_nav.dart';
import 'package:flutter/material.dart';

class NavView extends StatefulWidget {
  const NavView({super.key});
  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  int page = 0;
  List<Widget> pages = [
    const HomeView(),
    const Center(child: Text("Notifications")),
    const Center(child: Text("Statistics")),
    const Center(child: Text("Profile")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNav(
        onTap: (page) => setState(() => this.page = page),
        currentIndex: page,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "Profile",
          ),
        ],
      ),
      body: pages[page],
    );
  }
}
