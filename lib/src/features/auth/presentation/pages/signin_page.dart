import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final form = FormGroup({
    FormFieldNames.email: FormControl<String>(
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    FormFieldNames.password: FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(6),
      ],
    ),
  });

  bool canShowPassword = true;

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

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
                    CLTextField(
                      fcontrolName: FormFieldNames.email,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (control) =>
                          form.control(FormFieldNames.password).focus(),
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Email must be filled!',
                      },
                      label: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: IconsaxPlusLinear.sms,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CLTextField(
                      fcontrolName: FormFieldNames.password,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (control) =>
                          form.control(FormFieldNames.password).unfocus(),
                      validationMessages: {
                        ValidationMessage.required: (error) =>
                            'Password must be filled!',
                        ValidationMessage.minLength: (error) =>
                            'Password must be at least 6 characters long!',
                      },
                      label: 'Password',
                      hintText: 'Enter your Password',
                      prefixIcon: IconsaxPlusLinear.lock,
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
                      obscureText: canShowPassword,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text(
                          'Forgot Password?',
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.colorScheme.primary,
                            fontWeight: bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ReactiveFormConsumer(
                      builder: (context, formGroup, child) {
                        return CLButton(
                          text: 'Log In',
                          onPressed: formGroup.valid ? () {} : null,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  'Or',
                  style: context.textTheme.bodySmall,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: context.colorScheme.surfaceDim,
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.illustration.googleLogo.svg(
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Continue with Google',
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.onSurface,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              const SizedBox(
                height: 46,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don’t have an account? ',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.secondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Routes.signup.push(context);
                    },
                    child: Text(
                      'Sign Up',
                      style: context.textTheme.bodySmall?.copyWith(
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
    );
  }
}
