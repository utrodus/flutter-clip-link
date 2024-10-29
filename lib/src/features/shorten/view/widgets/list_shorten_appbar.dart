import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';

PreferredSizeWidget listShortenAppbar(
  BuildContext context,
) =>
    AppBar(
      title: Row(
        children: [
          Assets.images.logo.image(
            height: 32,
            width: 32,
          ),
          const SizedBox(
            width: 13.5,
          ),
          Text(
            'ClipLink',
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colorScheme.onPrimaryContainer,
              fontWeight: bold,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            onPressed: () {},
            icon: Assets.icons.icSearch.svg(
              colorFilter: ColorFilter.mode(
                context.colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
