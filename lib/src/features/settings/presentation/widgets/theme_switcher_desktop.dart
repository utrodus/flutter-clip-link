import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/settings/settings.dart';

class ThemeSwitcherDesktop extends StatelessWidget {
  const ThemeSwitcherDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 14,
        ),
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () => context.read<ThemeCubit>().changeThemeMode(
                        ThemeMode.light,
                      ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value: ThemeMode.light,
                        groupValue: state,
                        onChanged: (value) =>
                            context.read<ThemeCubit>().changeThemeMode(value!),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Assets.illustration.lightTheme.svg(
                        width: 80,
                        height: 60,
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        'Light Apperance',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () => context.read<ThemeCubit>().changeThemeMode(
                        ThemeMode.dark,
                      ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value: ThemeMode.dark,
                        groupValue: state,
                        onChanged: (value) =>
                            context.read<ThemeCubit>().changeThemeMode(value!),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Assets.illustration.darkTheme.svg(
                        width: 80,
                        height: 60,
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        'Dark Apperance',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
