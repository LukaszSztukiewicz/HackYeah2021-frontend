import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:landify/app/core/const/string.dart';

class AnimatedTexts extends StatelessWidget {
  const AnimatedTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          sBestPlaceFor,
          style: Theme.of(context).textTheme.headline2?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w900),
        ),
        //OptionalWidget(),
      ],
    );
  }
}

class OptionalWidget extends StatelessWidget {
  const OptionalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        for (var i in inhabitants)
          TypewriterAnimatedText(
            i,
            textStyle: Theme.of(context)
                .textTheme
                .headline2
                ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            speed: const Duration(milliseconds: 200),
          ),
      ],
      displayFullTextOnTap: true,
    );
  }
}
