import 'package:get/get.dart';
import 'package:landify/app/data/scores_model.dart';

class ScoresProvider extends GetConnect {
  Future<String> getScores(String address) async {
    print(address);
    final response = await get(
        "http://hackyeah2021-ai-put.herokuapp.com/api/v2/scores?address=Piotrkowska_4");
    if (response.status.hasError) {
      print("errror" + address + " " + response.status.code.toString());
      //return Future.error(response.statusText!);
      return '{"address":{"building_number":"17","street":"customStreet"},"coordinates":{"latitude":51.76721,"longitude":19.51357},"ratings":{"Alkohol store":4100,"Cafe":1160,"Convenience shop":440,"Crime index":12,"Hipermarket":1440,"Kindergarten":480,"Post office":1720,"Trum stop":390,"Universitiy":810},"targets":{"company flat":0.696566265060241,"couples":0.6224528301886794,"families":0.7720224719101123,"single":0.6450657894736842,"students":0.6400680272108843}}';
    } else {
      print("przeszlo" + address);
      //return scoresFromJson(response.body);
      return '{"address":{"building_number":"17","street":"customStreet"},"coordinates":{"latitude":51.76721,"longitude":19.51357},"ratings":{"Alkohol store":4100,"Cafe":1160,"Convenience shop":440,"Crime index":12,"Hipermarket":1440,"Kindergarten":480,"Post office":1720,"Trum stop":390,"Universitiy":810},"targets":{"company flat":0.696566265060241,"couples":0.6224528301886794,"families":0.7720224719101123,"single":0.6450657894736842,"students":0.6400680272108843}}';
    }
  }
}
