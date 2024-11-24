import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/settings/settings.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailShortenUrlPage extends StatelessWidget {
  const DetailShortenUrlPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailShortenUrlBloc, DetailShortenUrlState>(
      listener: (context, state) {
        if (state is DetailShortenUrlDeleteSuccess) {
          CLSnackbar(
            state.message,
            position: CLSnackbarPosition.customWidth,
            actionText: 'Okay',
          );
          Routes.listShorten.go(context);
        } else if (state is DetailShortenUrlDeleteFailure) {
          CLSnackbar.error(
            state.message,
            position: CLSnackbarPosition.customWidth,
            actionText: 'Try Again',
          );
        }
      },
      builder: (context, state) {
        if (state is DetailShortenUrlLoading) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Detail Shortened Url'),
            ),
            body: const SafeArea(
              child: Center(
                child: LoaderByPlatform(),
              ),
            ),
          );
        } else if (state is DetailShortenUrlSuccess) {
          final item = state.urlStatistics;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'https://www.spoo.me/${item.shortCode}',
                style: context.textTheme.titleMedium,
              ),
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      onTap: () {
                        ClDialog(
                          context: context,
                          type: CLDialogType.delete,
                          title: 'Are You Sure to Delete',
                          body: 'https://www.spoo.me/${item.shortCode}',
                          acceptTitle: 'Delete',
                          onPressedAccept: (_) {
                            context.read<DetailShortenUrlBloc>().add(
                                  DetailShortenUrlDeleteItem(
                                    shortCode: item.shortCode,
                                  ),
                                );
                          },
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(
                            IconsaxPlusLinear.trash,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Delete Item',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: Breakpoints.tablet,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(21),
                          color: context.colorScheme.surfaceContainerLowest,
                          width: double.infinity,
                          child: BlocBuilder<ThemeCubit, ThemeMode>(
                            builder: (context, state) {
                              return QrImageView(
                                data: 'https://www.spoo.me/${item.shortCode}',
                                version: QrVersions.auto,
                                size: 204,
                                backgroundColor: state == ThemeMode.dark
                                    ? Colors.white
                                    : context
                                        .colorScheme.surfaceContainerLowest,
                              );
                            },
                          ),
                        ),
                        const DetailShortenLabel(text: 'Shortened URL'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          color: context.colorScheme.surfaceContainerLowest,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'https://www.spoo.me/${item.shortCode}',
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    fontWeight: bold,
                                    color:
                                        context.colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await copyToClipboard(
                                    'https://www.spoo.me/${item.shortCode}',
                                  );
                                  CLSnackbar(
                                    '✅ Shortened URL copied to clipboard!',
                                    position: CLSnackbarPosition.customWidth,
                                  );
                                },
                                icon: const Icon(
                                  IconsaxPlusLinear.copy,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const DetailShortenLabel(text: 'Original URL'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          color: context.colorScheme.surfaceContainerLowest,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  item.originalUrl,
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    fontWeight: bold,
                                    color:
                                        context.colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await copyToClipboard(item.originalUrl);
                                  CLSnackbar(
                                    '✅ Original URL copied to clipboard!',
                                    position: CLSnackbarPosition.customWidth,
                                  );
                                },
                                icon: const Icon(
                                  IconsaxPlusLinear.copy,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (item.password != '') ...[
                          const DetailShortenLabel(
                            text: 'Password to Access',
                          ),
                          DetailShortenUrlPassword(
                            password: item.password ?? '',
                          ),
                        ],
                        const DetailShortenLabel(text: 'General Stats'),
                        DetailShortenGeneralStats(
                          totalClicks: item.totalClicks.toString(),
                          creationDate:
                              item.creationDate == '' ? '-' : item.creationDate,
                          lastClickDate: item.lastClickDate == ''
                              ? '-'
                              : item.lastClickDate,
                          lastClickBrowser: item.lastClickBrowser == ''
                              ? '-'
                              : item.lastClickBrowser,
                          lastClickOS:
                              item.lastClickOS == '' ? '-' : item.lastClickOS,
                          averageRedirectionTime:
                              item.averageRedirectionTime.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        var message = '';
        if (state is DetailShortenUrlNotExist) {
          message = state.message;
        } else if (state is DetailShortenUrlWrongPassword) {
          message = state.message;
        } else if (state is DetailShortenUrlFailure) {
          message = state.message;
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detail Shortened URl'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Icon(
                  IconsaxPlusBold.info_circle,
                  size: 128,
                  color: context.colorScheme.tertiary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                message,
                style: context.textTheme.titleLarge,
              ),
              const SizedBox(
                height: 24,
              ),
              CLButton(
                isLoading: false,
                minimumSize: const Size(50, 48),
                text: state is DetailShortenUrlWrongPassword
                    ? 'Input Password for Access Url'
                    : 'Back to Previous Page',
                onPressed: () {
                  final shortCode =
                      GoRouterState.of(context).uri.pathSegments.last;
                  if (state is DetailShortenUrlWrongPassword) {
                    context.goNamed(
                      Routes.inputPassword.name,
                      pathParameters: {
                        'shortCode': shortCode,
                      },
                    );
                  } else if (state is DetailShortenUrlNotExist ||
                      state is DetailShortenUrlFailure) {
                    Routes.listShorten.go(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
