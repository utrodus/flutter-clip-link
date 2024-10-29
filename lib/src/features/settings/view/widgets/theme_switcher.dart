import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/settings/settings.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

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
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: GestureDetector(
                    onTap: () => context.read<ThemeCubit>().changeThemeMode(
                          ThemeMode.light,
                        ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Assets.illustration.lightTheme.svg(
                          width: 141,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          'Light Apperance',
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Radio(
                          value: ThemeMode.light,
                          groupValue: state,
                          onChanged: (value) => context
                              .read<ThemeCubit>()
                              .changeThemeMode(value!),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 42,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: () => context.read<ThemeCubit>().changeThemeMode(
                          ThemeMode.dark,
                        ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Assets.illustration.darkTheme.svg(
                          width: 141,
                          height: 100,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          'Dark Apperance',
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        Radio(
                          value: ThemeMode.dark,
                          groupValue: state,
                          onChanged: (value) => context
                              .read<ThemeCubit>()
                              .changeThemeMode(value!),
                        ),
                      ],
                    ),
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
