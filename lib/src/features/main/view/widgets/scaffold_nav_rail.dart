import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
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
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Assets.images.logo.image(
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 13),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ClipLink',
                              style: context.textTheme.titleLarge?.copyWith(
                                fontWeight: medium,
                                color: context.colorScheme.onPrimaryContainer,
                              ),
                            ),
                            Text(
                              'Url Shortener',
                              style: context.textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
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
