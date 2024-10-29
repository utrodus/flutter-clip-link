import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class DetailShortenUrlPage extends StatelessWidget {
  const DetailShortenUrlPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'https://spoo.me/people-work',
          style: context.textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 248,
                ),
                child: Container(
                  padding: const EdgeInsets.all(21),
                  color: context.colorScheme.surfaceContainerLowest,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Spacer(),
                      const SizedBox(
                        width: 20,
                      ),
                      Assets.images.qrExample.image(
                        fit: BoxFit.contain,
                        width: 204,
                        height: 204,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton.filledTonal(
                            tooltip: 'Remove Shorten Item',
                            onPressed: () {
                              ClDialog(
                                context: context,
                                type: CLDialogType.delete,
                                title: 'Are You Sure to Delete',
                                body: 'https://spoo.me/people-work',
                                acceptTitle: 'Delete',
                                onPressedCancel: () {
                                  context.pop();
                                },
                                onPressedAccept: () {
                                  context.pop();
                                },
                              );
                            },
                            icon: const Icon(
                              IconsaxPlusLinear.trash,
                            ),
                          ),
                          IconButton.filledTonal(
                            tooltip: 'Add to favorites',
                            onPressed: () {},
                            icon: const Icon(
                              IconsaxPlusLinear.heart,
                            ),
                          ),
                          IconButton.filledTonal(
                            tooltip: 'Download QR Image',
                            onPressed: () {},
                            icon: const Icon(
                              Icons.file_download_outlined,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
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
                        'https://spoo.me/people-work',
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_outlined,
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
                        'https://originalurl-with-long-url.com',
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
              const DetailShortenLabel(text: 'Password to Access'),
              const DetailShortenUrlPassword(
                password: 'password',
              ),
              const DetailShortenLabel(text: 'General Stats'),
              const DetailShortenGeneralStats(),
            ],
          ),
        ),
      ),
    );
  }
}
