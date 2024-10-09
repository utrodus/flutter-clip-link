import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';

class ListShortenEmpty extends StatelessWidget {
  const ListShortenEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 91.26,
          ),
          Assets.illustration.shortenEmptyLight.svg(),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Simplify lengthy, complex links into short,',
            style: context.textTheme.titleSmall,
          ),
          Text(
            'customized aliases with a simple click!',
            style: context.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Click (+) Button to Start',
            style: context.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
