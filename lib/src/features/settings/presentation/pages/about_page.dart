import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final portfolioUri = Uri.parse('https://utrodus.com/about/');
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
        title: const Text('About App'),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.images.logo.image(
                        width: 67,
                        height: 67,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'ClipLink',
                            style: context.textTheme.titleMedium,
                          ),
                          Text(
                            'URL Shortener',
                            style: context.textTheme.labelMedium,
                          ),
                          Text(
                            'Version: 1.0.0',
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  Text(
                    'ClipLink App is a URL shortener that '
                    'allows you to quickly '
                    'create short links. ',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Built with Flutter and Material Design 3, '
                    ' ClipLink offers a seamless user experience '
                    'across multiple platforms, '
                    'including Android, iOS, and web.',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'By integrating the Spoo.me API, '
                    'ClipLink makes it easy to convert '
                    'long URLs into concise, shareable links, '
                    'while also providing URL analytics '
                    'to track the performance of each link.',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'App Features',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 3,
                        ),
                        child: Icon(
                          IconsaxPlusBold.link_21,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Quick URL Shortening: ',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'Quickly generate short links '
                                    'with the Spoo.me API.',
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 3,
                        ),
                        child: Icon(
                          IconsaxPlusLinear.star_1,
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Add to Favorites: ',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'Add your shorten link to favorites. ',
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 3,
                        ),
                        child: Icon(
                          IconsaxPlusLinear.mobile,
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'Cross-Platform: ',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'Smooth performance on iOS, '
                                    'Android, and web.',
                                style: context.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'About The Developer',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
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
                          'Discover more projects at:',
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
