import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/splash/splash.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashLoaded) {
          Routes.listShorten.go(context);
        }
      },
      child: Scaffold(
        backgroundColor: context.colorScheme.primaryContainer,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.images.logo.image(
                      width: 57,
                      height: 57,
                    ),
                    const SizedBox(width: 13),
                    Text(
                      'ClipLink',
                      style: context.textTheme.displaySmall?.copyWith(
                        fontWeight: medium,
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Center(
                child: LoaderByPlatform(),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
