import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final form = FormGroup(
    {
      FormFieldNames.fullName: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(3),
        ],
      ),
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
      FormFieldNames.confirmPassword: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(6),
        ],
      ),
    },
    validators: [
      Validators.mustMatch(
        FormFieldNames.password,
        FormFieldNames.confirmPassword,
      ),
    ],
  );

  bool canShowPassword = true;
  bool canShowConfirmPassword = true;

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

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
              padding: const EdgeInsets.only(
                top: 14,
                bottom: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                      icon: Icon(
                        IconsaxPlusLinear.arrow_left,
                        color: context.colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'Sign up',
                      style: context.textTheme.headlineLarge?.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'Create an account to continue!',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: ReactiveForm(
                      formGroup: form,
                      child: Column(
                        children: <Widget>[
                          CLTextField(
                            fcontrolName: FormFieldNames.fullName,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) => {
                              form.control(FormFieldNames.email).focus(),
                            },
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Full Name must be filled!',
                              ValidationMessage.minLength: (error) =>
                                  'Full Name must be at least 3 characters long!',
                            },
                            label: 'Full Name',
                            hintText: 'Enter your full name',
                            prefixIcon: IconsaxPlusLinear.user,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CLTextField(
                            fcontrolName: FormFieldNames.email,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) => {
                              form.control(FormFieldNames.password).focus(),
                            },
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Email must be filled!',
                              ValidationMessage.email: (error) =>
                                  'Email must be valid!',
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
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) => {
                              form
                                  .control(FormFieldNames.confirmPassword)
                                  .focus(),
                            },
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Password must be filled!',
                              ValidationMessage.minLength: (error) =>
                                  'Password must be at least 6 characters long!',
                            },
                            label: 'Password',
                            hintText: 'Enter your password',
                            prefixIcon: IconsaxPlusLinear.lock,
                            suffixIcon: GestureDetector(
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
                            height: 24,
                          ),
                          CLTextField(
                            fcontrolName: FormFieldNames.confirmPassword,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => {
                              form
                                  .control(FormFieldNames.confirmPassword)
                                  .unfocus(),
                            },
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Confirm Password must be filled!',
                              ValidationMessage.minLength: (error) =>
                                  'Confirm Password must be at least'
                                  ' 6 characters long!',
                              ValidationMessage.mustMatch: (error) =>
                                  'Password and Confirm Password must match!',
                            },
                            label: 'Confirm Password',
                            hintText: 'Enter Confirm Password',
                            prefixIcon: IconsaxPlusLinear.lock_1,
                            suffixIcon: GestureDetector(
                              child: Icon(
                                canShowConfirmPassword
                                    ? IconsaxPlusLinear.eye
                                    : IconsaxPlusLinear.eye_slash,
                                color: context.colorScheme.secondary,
                              ),
                              onTap: () => setState(
                                () => canShowConfirmPassword =
                                    !canShowConfirmPassword,
                              ),
                            ),
                            obscureText: canShowConfirmPassword,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ReactiveFormConsumer(
                            builder: (context, formGroup, child) {
                              return CLButton(
                                text: 'Register',
                                onPressed: formGroup.valid ? () {} : null,
                              );
                            },
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
                        ],
                      ),
                    ),
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
