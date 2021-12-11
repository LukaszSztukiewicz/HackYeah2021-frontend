import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:landify/app/core/const/colors.dart';
import 'package:landify/app/core/const/icons.dart';
import 'package:landify/app/core/const/string.dart';
import 'package:landify/app/core/const/vars.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: vMspacing.w),
          child: Text(
            sAppTitle,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .apply(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        //TODO leading: svg_logo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(vXLspacing.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sBestPlaceFor,
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    for (var i in inhabitants)
                      TypewriterAnimatedText(
                        i,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                        speed: const Duration(milliseconds: 200),
                      ),
                  ],
                  displayFullTextOnTap: true,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SearchBar(),
              ElevatedButton(
                onPressed: sendRequest,
                child: Padding(
                    padding: EdgeInsets.all(vLspacing.w), child: iconSearch),
                style: ElevatedButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.button,
                    primary: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
          //CustomButton(),
          //CustomButton(),
          //ScoresList(),
        ],
      ),
    );
  }
}

class ScoresList extends StatelessWidget {
  const ScoresList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800.w,
      height: 500.h,
      child: ListView(
        children: [
          for (var i in lodzStreets)
            ListTile(
              leading: mapMaker,
              title: Text(
                i,
              ),
            )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(vMspacing.w),
      child: OutlinedButton(
          child: Text(
            "dejidjdwwdjoppwdjoooooo",
            style: Theme.of(context).textTheme.button,
          ),
          style: OutlinedButton.styleFrom(
              padding: EdgeInsets.all(vMspacing.w),
              textStyle: Theme.of(context).textTheme.button,
              primary: Theme.of(context).colorScheme.secondary),
          onPressed: sendRequest),
    );
  }
}

void sendRequest() {}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 960.w,
      child: TextField(
        //TODO autofillHints: lodzStreets,
        style: Theme.of(context).textTheme.headline3,
        decoration: const InputDecoration(
            hintText: sHintTextSearchBar,
            labelText: sLabelTextSearchBar,
            prefixIcon: Padding(
              padding: EdgeInsets.all(20.0),
              child: mapMaker,
            ),
            border: OutlineInputBorder()),
      ),
    );
  }
}
