import 'package:get/get.dart';
import 'package:landify/app/data/scores_model.dart';
import 'package:landify/app/data/scores_provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  RxString address = "".obs;
  late Scores scores;

  bool hasAddress() {
    return address.value.isNotEmpty;
  }

  bool hasScores() {
    getData();
    return scores.address.street.isNotEmpty;
  }

  void getData() async {
    await ScoresProvider().getScores(address.value).then(
      (respScores) {
        scores = respScores;
        update();
      },
      onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      },
    );
  }
}
