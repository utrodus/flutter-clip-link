import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    required this.navShell,
    super.key,
  });

  final StatefulNavigationShell navShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              IconsaxPlusLinear.global_edit,
            ),
            selectedIcon: Icon(
              IconsaxPlusBold.global_edit,
            ),
            label: 'Shorten',
          ),
          NavigationDestination(
            icon: Icon(
              IconsaxPlusLinear.heart,
            ),
            selectedIcon: Icon(
              IconsaxPlusBold.heart,
            ),
            label: 'Favorited',
          ),
          NavigationDestination(
            icon: Icon(
              IconsaxPlusLinear.setting_2,
            ),
            selectedIcon: Icon(
              IconsaxPlusBold.setting_2,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
