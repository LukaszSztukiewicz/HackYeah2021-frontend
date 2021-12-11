import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
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
          children: []),
    );
  }
}
