import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddNewShortenUrlPage extends StatefulWidget {
  const AddNewShortenUrlPage({super.key});

  @override
  State<AddNewShortenUrlPage> createState() => _AddNewShortenUrlPageState();
}

class _AddNewShortenUrlPageState extends State<AddNewShortenUrlPage> {
  final form = FormGroup({
    FormFieldNames.longUrl: FormControl<String>(
      validators: [
        Validators.required,
        Validators.pattern(urlRegex),
      ],
    ),
    FormFieldNames.customAlias: FormControl<String>(),
    FormFieldNames.urlPassword: FormControl<String>(
      validators: [
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
    final responsive = Responsive(context);
    return BlocListener<AddNewShortenUrlBloc, AddNewShortenUrlState>(
      listener: (context, state) {
        if (state is AddNewShortenUrlSuccess) {
          CLSnackbar(state.message);
          Routes.listShorten.go(context);
        } else if (state is AddNewShortenUrlFailure) {
          CLSnackbar.error(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: responsive.isDesktop || responsive.isLargeDesktop,
          title: const Text('Add New Shorten URL'),
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
                  children: <Widget>[
                    ReactiveForm(
                      formGroup: form,
                      child: Column(
                        children: <Widget>[
                          CLTextField(
                            autofocus: true,
                            fcontrolName: FormFieldNames.longUrl,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (control) => form
                                .control(FormFieldNames.customAlias)
                                .focus(),
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Long Url must be filled!',
                              ValidationMessage.email: (error) =>
                                  'Url must be valid!',
                            },
                            label: 'Long URL',
                            hintText: 'https://www.your-long-url.com',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CLTextField(
                            fcontrolName: FormFieldNames.customAlias,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (control) => form
                                .control(FormFieldNames.urlPassword)
                                .focus(),
                            label: 'Custom Alias',
                            hintText: 'your-custom-alias',
                            helperText: 'leave blank for random url slug',
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CLTextField(
                            fcontrolName: FormFieldNames.urlPassword,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (control) => form
                                .control(FormFieldNames.urlPassword)
                                .unfocus(),
                            validationMessages: {
                              ValidationMessage.required: (error) =>
                                  'Password must be filled!',
                              ValidationMessage.minLength: (error) =>
                                  'Password must be at least'
                                  ' 6 characters long!',
                            },
                            label: 'Password',
                            hintText: 'Password to access url',
                            helperText: 'optional password for access url',
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
                            height: 33,
                          ),
                          ReactiveFormConsumer(
                            builder: (context, formGroup, child) {
                              return BlocBuilder<AddNewShortenUrlBloc,
                                  AddNewShortenUrlState>(
                                builder: (context, state) {
                                  return CLButton(
                                    isLoading: state is AddNewShortenUrlLoading,
                                    text: 'Shorten URL',
                                    onPressed: formGroup.valid
                                        ? () {
                                            final longUrl = form
                                                .control(FormFieldNames.longUrl)
                                                .value as String;
                                            final alias = form
                                                .control(
                                                  FormFieldNames.customAlias,
                                                )
                                                .value as String?;
                                            final password = form
                                                .control(
                                                  FormFieldNames.urlPassword,
                                                )
                                                .value as String?;

                                            context
                                                .read<AddNewShortenUrlBloc>()
                                                .add(
                                                  AddNewShortenUrlRequest(
                                                    url: longUrl,
                                                    alias: alias,
                                                    password: password,
                                                  ),
                                                );
                                          }
                                        : null,
                                  );
                                },
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
      ),
    );
  }
}
