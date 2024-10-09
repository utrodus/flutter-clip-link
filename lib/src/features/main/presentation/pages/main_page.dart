import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/features/main/main.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MainPage extends StatelessWidget {
  MainPage({
    required this.navShell,
    super.key,
  });

  final StatefulNavigationShell navShell;
  final List<NavDestinationModel> destinations = [
    NavDestinationModel(
      icon: const Icon(
        IconsaxPlusLinear.global_edit,
      ),
      selectedIcon: const Icon(
        IconsaxPlusBold.global_edit,
      ),
      label: 'Shorten',
    ),
    NavDestinationModel(
      icon: const Icon(
        IconsaxPlusLinear.heart,
      ),
      selectedIcon: const Icon(
        IconsaxPlusBold.heart,
      ),
      label: 'Favorited',
    ),
    NavDestinationModel(
      icon: const Icon(
        IconsaxPlusLinear.setting_2,
      ),
      selectedIcon: const Icon(
        IconsaxPlusBold.setting_2,
      ),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 480) {
          return ScaffoldNavBar(
            onDestinationSelected: onDestinationSelected,
            body: navShell,
            selectedIndex: navShell.currentIndex,
            destinations: destinations,
          );
        } else {
          return ScaffoldNavRail(
            onDestinationSelected: onDestinationSelected,
            body: navShell,
            selectedIndex: navShell.currentIndex,
            destinations: destinations,
          );
        }
      },
    );
  }

  void onDestinationSelected(int index) {
    navShell.goBranch(index, initialLocation: index == navShell.currentIndex);
  }
}
