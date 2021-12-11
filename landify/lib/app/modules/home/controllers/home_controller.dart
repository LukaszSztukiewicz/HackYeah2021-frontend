import 'package:get/get.dart';
import 'package:landify/app/data/scores_provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  final street = "".obs;
  final buildingNumber = "".obs;
  @override
  void onInit() {
    super.onInit();
    ScoresProvider().getScores(street.value, buildingNumber.value).then(
        (response) {
      change(
        response,
        status: RxStatus.success(),
      );
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
