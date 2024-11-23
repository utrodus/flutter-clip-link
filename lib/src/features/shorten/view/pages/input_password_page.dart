import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InputPasswordPage extends StatefulWidget {
  const InputPasswordPage({
    required this.shortCode,
    super.key,
  });

  final String shortCode;

  @override
  State<InputPasswordPage> createState() => _InputPasswordPageState();
}

class _InputPasswordPageState extends State<InputPasswordPage> {
  final form = FormGroup({
    FormFieldNames.urlPassword: FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(8),
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
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Password'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical:
                responsive.isDesktop || responsive.isLargeDesktop ? 64 : 16,
            horizontal: 16,
          ),
          child: Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: Breakpoints.tablet,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please Input password for access Url',
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ReactiveForm(
                    formGroup: form,
                    child: Column(
                      children: [
                        CLTextField(
                          fcontrolName: FormFieldNames.urlPassword,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (_) {},
                          validationMessages: {
                            ValidationMessage.required: (error) =>
                                'Password must be filled',
                            ValidationMessage.minLength: (error) =>
                                'Password must be at least '
                                '8 characters long!',
                          },
                          suffixIcon: GestureDetector(
                            child: Icon(
                              canShowPassword
                                  ? IconsaxPlusLinear.eye
                                  : IconsaxPlusLinear.eye_slash,
                              color: context.colorScheme.primary,
                            ),
                            onTap: () {
                              setState(() {
                                canShowPassword = !canShowPassword;
                              });
                            },
                          ),
                          obscureText: canShowPassword,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ReactiveFormConsumer(
                          builder: (context, formGroup, child) {
                            return CLButton(
                              isLoading: false,
                              text: 'Submit Password',
                              onPressed: formGroup.valid
                                  ? () {
                                      final password = form
                                          .control(FormFieldNames.urlPassword)
                                          .value as String;
                                      context.goNamed(
                                        Routes.detailShortenURL.name,
                                        pathParameters: {
                                          'shortCode': widget.shortCode,
                                        },
                                        extra: password,
                                      );
                                    }
                                  : null,
                            );
                          },
                        ),
                      ],
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
