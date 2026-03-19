import 'package:collection/collection.dart';
import 'package:demo_banking/presentation/shared/utils/context_extension.dart';
import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final Function(int)? onTap;
  const AppBottomNav({
    super.key,
    this.items = const [],
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        boxShadow: [BoxShadow(color: Colors.grey)],
      ),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SafeArea(
        child: Row(
          children: items.mapIndexed((index, item) {
            return Expanded(
              child: InkWell(
                onTap: () => onTap?.call(index),
                child: Theme(
                  data: ThemeData(
                    iconTheme: IconThemeData(
                      color: index == currentIndex
                          ? context.theme.primaryColor
                          : Colors.grey,
                    ),
                  ),
                  child: item.icon,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
