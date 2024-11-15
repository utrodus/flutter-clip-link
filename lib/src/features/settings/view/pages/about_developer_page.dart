import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDeveloperPage extends StatefulWidget {
  const AboutDeveloperPage({super.key});

  @override
  State<AboutDeveloperPage> createState() => _AboutDeveloperPageState();
}

class _AboutDeveloperPageState extends State<AboutDeveloperPage> {
  final portfolioUri = Uri.parse('utrodus.com/');
  Future<void> _launchUrl() async {
    final canLaunchUrl = await launchUrl(
      portfolioUri,
      mode: LaunchMode.inAppBrowserView,
    );

    if (!canLaunchUrl) {
      _showErrorDialog();
      throw Exception('Could not launch $portfolioUri');
    }
  }

  void _showErrorDialog() {
    ClDialog(
      context: context,
      type: CLDialogType.withoutCancelButton,
      title: 'Sorry for the inconvenience',
      body: 'Could not launch $portfolioUri',
      onPressedAccept: context.pop,
      acceptTitle: 'Ok',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About The Developer'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage(Assets.images.utrodusProfilePhoto.path),
                  ),
                  const SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                      text: 'Developed by ',
                      style: context.textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: 'Utrodus Said Al Baqi, ',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: bold,
                          ),
                        ),
                        TextSpan(
                          text: 'a software engineer focused on '
                              'creating beautiful, '
                              'cross-platform apps using ',
                          style: context.textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: 'Flutter.',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Discover more about me at:',
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 0,
                          ),
                          side: BorderSide(
                            width: 0.8,
                            color: context.colorScheme.outlineVariant,
                          ),
                        ),
                        onPressed: _launchUrl,
                        child: const Text(
                          'utrodus.com',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
