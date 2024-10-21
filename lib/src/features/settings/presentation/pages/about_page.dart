import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late TapGestureRecognizer _onTapRecognizer;
  final portfolioUri = Uri.parse('https://utrodus.com/');
  @override
  void initState() {
    super.initState();
    _onTapRecognizer = TapGestureRecognizer()..onTap = _handleOnTap;
  }

  void _handleOnTap() {
    _launchUrl();
  }

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
      onPressedAccept: () => context.pop(),
      acceptTitle: 'Ok',
    );
  }

  @override
  void dispose() {
    super.dispose();
    _onTapRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.images.logo.image(
                    width: 57,
                    height: 57,
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'ClipLink',
                        style: context.textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        'URL Shortener',
                        style: context.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              Text(
                'ClipLink App is a user-friendly URL shortener '
                'that allows you to quickly create '
                'short links for your favorite websites. ',
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Built with Flutter, it offers a seamless '
                'experience across Android, iOS and web.',
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Using the Spoo.me API, ClipLink makes it easy '
                'to convert long URLs into concise, shareable links.',
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'App Features',
                style: context.textTheme.titleMedium,
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
                      Icons.star,
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
                            text: 'Effortlessly generate short links '
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
                      Icons.star,
                      size: 16,
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
                            text:
                                'Smooth performance on iOS, Android, and web.',
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
                      Icons.star,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'Clean Interface: ',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'Implement Material Design 3 ',
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'About The Developer',
                style: context.textTheme.titleMedium,
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
                      text:
                          'a software engineer focused on creating beautiful, '
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
              RichText(
                text: TextSpan(
                  text: 'Discover more projects and case studies at',
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: ' utrodus.com',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: bold,
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                      recognizer: _onTapRecognizer,
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
