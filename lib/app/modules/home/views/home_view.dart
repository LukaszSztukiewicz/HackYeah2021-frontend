import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:landify/app/core/const/icons.dart';
import 'package:landify/app/core/const/string.dart';
import 'package:landify/app/core/const/vars.dart';
import 'package:landify/app/widgets/animatedtexts.dart';
import 'package:landify/app/widgets/searchbutton.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
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
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, vMspacing.w, 0),
            child: IconButton(
              onPressed: () {
                if (Get.isDarkMode) {
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                }
              },
              icon: iconLightBulb,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          )
        ],
        //TODO leading: svg_logo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(vXLspacing.w),
            child: const AnimatedTexts(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SearchBar(),
              SearchButton(),
            ],
          ),
          //CustomButton(),
          //CustomButton(),
          ScoresList(),
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
    return SizedBox(
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
            ),
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
        onPressed: () {
          Get.snackbar(sSnackBarTitle, sRequestSent,
              snackPosition: SnackPosition.BOTTOM,
              colorText: Theme.of(context).colorScheme.onSurface,
              backgroundColor: Theme.of(context).colorScheme.surface);
        },
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 960.w,
      child: TextField(
        autofillHints: const [AutofillHints.streetAddressLevel1],
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
