import 'package:clip_link_repository/clip_link_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/settings/settings.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailShortenUrlPage extends StatelessWidget {
  const DetailShortenUrlPage({
    required this.shortCode,
    super.key,
  });

  final String shortCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'shortener url',
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
                    body: 'shortener url',
                    acceptTitle: 'Delete',
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
                      data: 'item.originalUrl',
                      version: QrVersions.auto,
                      size: 204,
                      backgroundColor: state == ThemeMode.dark
                          ? Colors.white
                          : context.colorScheme.surfaceContainerLowest,
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
                        'item.shortenedUrl',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: bold,
                          color: context.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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
                        'item.originalUrl',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: bold,
                          color: context.colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        IconsaxPlusLinear.copy,
                      ),
                    ),
                  ],
                ),
              ),
              // if (item.isHavePassword) ...[
              //   const DetailShortenLabel(text: 'Password to Access'),
              //   DetailShortenUrlPassword(
              //     password: item.password ?? '',
              //   ),
              // ],
              const DetailShortenLabel(text: 'General Stats'),
              const DetailShortenGeneralStats(),
            ],
          ),
        ),
      ),
    );
  }
}
