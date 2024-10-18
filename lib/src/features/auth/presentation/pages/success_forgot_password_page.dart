import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SuccessForgotPasswordPage extends StatelessWidget {
  const SuccessForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.mobile,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Routes.signin.go(context);
                    },
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    icon: Icon(
                      IconsaxPlusLinear.arrow_left,
                      color: context.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Text(
                      'Email has been sent!',
                      style: context.textTheme.headlineLarge?.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Center(
                    child: Text(
                      'Please check your inbox and click in the',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: Text(
                      ' received link to reset a password',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.secondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 67,
                  ),
                  Center(
                    child: Assets.illustration.emailSent.svg(
                      width: 160,
                      height: 160,
                    ),
                  ),
                  const SizedBox(
                    height: 85,
                  ),
                  Center(
                    child: CLButton(
                      text: 'Back',
                      onPressed: () {
                        Routes.signin.go(context);
                      },
                      minimumSize: const Size(260, 44),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Didn’t receive the link? ',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colorScheme.secondary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Routes.signup.push(context);
                        },
                        child: Text(
                          'Resend',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.primary,
                            fontWeight: bold,
                          ),
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
