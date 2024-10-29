import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/settings/presentation/widgets/theme_switcher_desktop.dart';
import 'package:flutter_clip_link/src/features/settings/settings.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  'Preferences',
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              responsive.onlyVisibleOnMobileTablet(
                child: const ThemeSwitcher(),
              ),
              responsive.onlyVisibleOnDesktopAndLarge(
                child: const ThemeSwitcherDesktop(),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  'More Information',
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    MenuTile(
                      onTap: () {
                        GoRouter.of(context).go(
                          '${Routes.settings.path}/${Routes.about.path}',
                        );
                      },
                      title: 'About App',
                      leading: Assets.illustration.logoCircle.svg(
                        width: 38,
                        height: 38,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                    MenuTile(
                      onTap: () {},
                      title: 'Information & Rate Limits',
                      leading: CircleAvatar(
                        backgroundColor: context.colorScheme.secondaryContainer,
                        radius: 20,
                        child: const Icon(
                          IconsaxPlusLinear.calculator,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                    MenuTile(
                      onTap: () {},
                      title: 'Term Of Service',
                      leading: CircleAvatar(
                        backgroundColor: context.colorScheme.secondaryContainer,
                        radius: 20,
                        child: const Icon(
                          IconsaxPlusLinear.document_text,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                    MenuTile(
                      onTap: () {},
                      title: 'Privacy Policy',
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: context.colorScheme.secondaryContainer,
                        child: const Icon(
                          IconsaxPlusLinear.document_text_1,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
