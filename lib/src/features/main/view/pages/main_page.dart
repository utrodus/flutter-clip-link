import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/favorited/favorited.dart';
import 'package:flutter_clip_link/src/features/main/main.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';
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
    final responsive = Responsive(context);

    return responsive.builder(
      mobile: ScaffoldNavBar(
        onDestinationSelected: onDestinationSelected,
        body: navShell,
        selectedIndex: navShell.currentIndex,
        destinations: destinations,
        initOnSelectedIndex: (index) =>
            initOnSelectedIndex(context, index: index),
      ),
      desktop: ScaffoldNavRail(
        onDestinationSelected: onDestinationSelected,
        body: navShell,
        selectedIndex: navShell.currentIndex,
        destinations: destinations,
        initOnSelectedIndex: (index) =>
            initOnSelectedIndex(context, index: index),
      ),
    );
  }

  void initOnSelectedIndex(
    BuildContext context, {
    required int index,
  }) {
    switch (index) {
      case 0:
        context.read<ListShortenUrlBloc>().add(
              ListShortenUrlLoadRecent(),
            );
        break;
      case 1:
        context.read<ListFavoritesBloc>().add(
              ListFavoritesLoad(),
            );
        break;
      default:
        break;
    }
  }

  void onDestinationSelected(int index) {
    navShell.goBranch(index, initialLocation: index == navShell.currentIndex);
  }
}
