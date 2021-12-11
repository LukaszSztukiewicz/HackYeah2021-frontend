import 'package:get/get.dart';
import 'package:landify/app/data/scores_provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  RxString street = "".obs;
  RxString buildingNumber = "".obs;
  RxBool hasData = false.obs;
  void getData() async {
    ScoresProvider().getScores(street.value, buildingNumber.value).then(
        (response) {
      change(
        response,
        status: RxStatus.success(),
      );
      //print(response);
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });

    hasData.value = !hasData.value;
  }
}
