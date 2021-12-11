import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(),
              CustomButton(),
            ],
          ),
          Container(
            width: 800.w,
            height: 600.h,
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
          onPressed: () {}),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //TODO autofillHints: lodzStreets,
      style: Theme.of(context).textTheme.headline2,
      decoration: const InputDecoration(
          hintText: sHintTextSearchBar,
          labelText: sLabelTextSearchBar,
          prefixIcon: Padding(
            padding: EdgeInsets.all(20.0),
            child: mapMaker,
          ),
          border: OutlineInputBorder()),
    );
  }
}
