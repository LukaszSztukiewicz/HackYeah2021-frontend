import 'package:get/get.dart';

class ScoresProvider extends GetConnect {
  Future<List<dynamic>> getScores(String street, String buildingNumber) async {
    final response = await get(
        "hackyeah2021-ai-put.herokuapp.com/api/v1/scores?street={$street}&building_number={$buildingNumber}");
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }
}
