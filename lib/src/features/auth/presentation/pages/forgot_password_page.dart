import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final form = FormGroup(
    {
      FormFieldNames.email: FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
    },
  );

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
                  Center(
                    child: Text(
                      'Forgot Password',
                      style: context.textTheme.headlineLarge?.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 23,
                    ),
                    child: Text(
                      'Enter your registered email below to receive password '
                      'reset instruction',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.secondary,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                            fcontrolName: FormFieldNames.email,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => {
                              form.control(FormFieldNames.email).focus(),
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
                          ReactiveFormConsumer(
                            builder: (context, formGroup, child) {
                              return CLButton(
                                text: 'Submit',
                                onPressed: formGroup.valid
                                    ? () {
                                        Routes.successForgotPassword
                                            .go(context);
                                      }
                                    : null,
                              );
                            },
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
