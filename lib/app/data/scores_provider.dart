import 'package:get/get.dart';

class ScoresProvider extends GetConnect {
  Future<List<dynamic>> getScores(String address) async {
    final response = await get(
        "hackyeah2021-ai-put.herokuapp.com/api/v1/scores?address={$address}");
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
