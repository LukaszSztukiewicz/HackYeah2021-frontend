import 'package:landify/app/data/scores_model.dart';
import 'dart:convert';

void main(List<String> args) {
  print("sjjsjsj");
  Map<String, dynamic> user = json.decode(
      '{"building_number":"xdddddddd","city":null,"code":null,"street":"placeholder"}');
  print(user["building_number"]);
  Scores state = scoresFromJson(
      '{"address":{"building_number":null,"city":null,"code":null,"street":"placeholder"},"results":{"convenience":{"reasons":["Too much conveniences nearby","Many citizens","No offices nearby","No universities or public education nearby"],"score":0.0003},"office":{"reasons":["Close to main road","Close to railway station","Nearby tram","Not so many offices nearby"],"score":0.2245}}}');
}
