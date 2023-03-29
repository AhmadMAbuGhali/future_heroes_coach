class ChoessCoachModel {
  String? subCategoryName;
  int? subCategoryId;
  List<Coaches>? coaches;

  ChoessCoachModel({this.subCategoryName, this.subCategoryId, this.coaches});

  ChoessCoachModel.fromJson(Map<String, dynamic> json) {
    subCategoryName = json['subCategoryName'];
    subCategoryId = json['subCategoryId'];
    if (json['coaches'] != null) {
      coaches = <Coaches>[];
      json['coaches'].forEach((v) {
        coaches!.add(new Coaches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subCategoryName'] = this.subCategoryName;
    data['subCategoryId'] = this.subCategoryId;
    if (this.coaches != null) {
      data['coaches'] = this.coaches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coaches {
  String? email;
  String? imageString;
  String? fullName;
  String? subCategoryId;

  Coaches({this.email, this.imageString, this.fullName, this.subCategoryId});

  Coaches.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    imageString = json['imageString'];
    fullName = json['fullName'];
    subCategoryId = json['subCategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['imageString'] = this.imageString;
    data['fullName'] = this.fullName;
    data['subCategoryId'] = this.subCategoryId;
    return data;
  }
}

