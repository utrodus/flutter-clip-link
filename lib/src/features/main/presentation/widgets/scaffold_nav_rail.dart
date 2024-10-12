import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/features/main/main.dart';

class ScaffoldNavRail extends StatelessWidget {
  const ScaffoldNavRail({
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
      body: Row(
        children: <Widget>[
          BlocBuilder<ScaffoldNavRailCubit, ScaffoldNavRailState>(
            builder: (context, state) {
              return NavigationRail(
                useIndicator: true,
                selectedIndex: selectedIndex,
                extended: state.isExtended,
                destinations: destinations
                    .map(
                      (navItem) => NavigationRailDestination(
                        label: Text(
                          navItem.label,
                        ),
                        icon: navItem.icon,
                        selectedIcon: navItem.selectedIcon,
                      ),
                    )
                    .toList(),
                onDestinationSelected: (index) {
                  onDestinationSelected(index);
                  initOnSelectedIndex(index);
                },
              );
            },
          ),
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
