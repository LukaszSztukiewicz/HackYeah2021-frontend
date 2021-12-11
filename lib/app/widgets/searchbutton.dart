import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:landify/app/core/const/icons.dart';
import 'package:landify/app/core/const/string.dart';
import 'package:landify/app/core/const/vars.dart';
import 'package:landify/app/modules/home/controllers/home_controller.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.snackbar(
          sSnackBarTitle,
          sRequestSent,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Theme.of(context).colorScheme.surface,
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          maxWidth: 500.w,
          animationDuration: const Duration(milliseconds: 500),
          isDismissible: true,
          duration: const Duration(milliseconds: 1500),
        );
        Get.find<HomeController>().getData();
      },
      child: Padding(padding: EdgeInsets.all(vLspacing.w), child: iconSearch),
      style: ElevatedButton.styleFrom(
          textStyle: Theme.of(context).textTheme.button,
          primary: Theme.of(context).colorScheme.secondary),
    );
  }
}
