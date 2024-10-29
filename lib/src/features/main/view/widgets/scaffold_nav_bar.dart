import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/features/main/models/nav_destination_model.dart';

class ScaffoldNavBar extends StatelessWidget {
  const ScaffoldNavBar({
    required this.onDestinationSelected,
    required this.body,
    required this.selectedIndex,
    required this.destinations,
    required this.initOnSelectedIndex,
    super.key,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<NavDestinationModel> destinations;
  final Function(int index) initOnSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: destinations
            .map(
              (navItem) => NavigationDestination(
                label: navItem.label,
                icon: navItem.icon,
                selectedIcon: navItem.selectedIcon,
              ),
            )
            .toList(),
        onDestinationSelected: (index) {
          onDestinationSelected(index);
          initOnSelectedIndex(index);
        },
      ),
    );
  }
}
