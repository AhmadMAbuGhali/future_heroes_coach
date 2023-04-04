import 'package:future_heroes_coach/main.dart';
import 'package:future_heroes_coach/resources/strings_manager.dart';

class StandardRateModel {
  String? name;
  int? id;

  StandardRateModel({
    this.name,
    this.id,
  });

  StandardRateModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;

    data['id'] = this.id;

    return data;
  }
}
