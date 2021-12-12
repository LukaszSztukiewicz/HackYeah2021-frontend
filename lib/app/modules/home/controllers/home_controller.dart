import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landify/app/data/scores_model.dart';
import 'package:landify/app/data/scores_provider.dart';

class HomeController extends GetxController {
  RxString address = "".obs;
  late Scores scores;
  RxBool hasData = false.obs;

  bool hasAddress() {
    return address.value.isNotEmpty;
  }

  void getData() async {
    await ScoresProvider().getScores(address.value).then(
      (respScores) {
        scores = respScores;
        hasData.value = true;
      },
      onError: (err) {
        Get.dialog(err);
      },
    );
  }
}
