import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final form = FormGroup({
    'email': FormControl<String>(
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(6),
      ],
    ),
  });

  bool canShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 22,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Assets.images.logo.image(
                    width: 20.81,
                    height: 20.81,
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Text(
                    'ClipLink',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.onPrimaryContainer,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 34.19,
              ),
              Text(
                'Sign in to your\nAccount',
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                'Enter your email and password to log in',
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              ReactiveForm(
                formGroup: form,
                child: Column(
                  children: <Widget>[
                    ReactiveTextField(
                      formControlName: 'email',
                      decoration: const InputDecoration()
                          .applyDefaults(Theme.of(context).inputDecorationTheme)
                          .copyWith(
                            label: const Text('Email'),
                            hintText: 'Enter your email',
                            prefixIcon: Icon(
                              IconsaxPlusLinear.sms,
                              color: context.colorScheme.secondary,
                            ),
                          ),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (control) =>
                          form.control('password').focus(),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Email must be filled!',
                      },
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    ReactiveTextField(
                      formControlName: 'password',
                      decoration: const InputDecoration()
                          .applyDefaults(Theme.of(context).inputDecorationTheme)
                          .copyWith(
                            label: const Text('Password'),
                            hintText: 'Enter your Password',
                            prefixIcon: Icon(
                              IconsaxPlusLinear.lock,
                              color: context.colorScheme.secondary,
                            ),
                            suffix: GestureDetector(
                              child: Icon(
                                canShowPassword
                                    ? IconsaxPlusLinear.eye
                                    : IconsaxPlusLinear.eye_slash,
                                color: context.colorScheme.secondary,
                              ),
                              onTap: () => setState(
                                () => canShowPassword = !canShowPassword,
                              ),
                            ),
                          ),
                      obscureText: canShowPassword,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (control) =>
                          form.control('password').unfocus(),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Password must be filled!',
                      },
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
