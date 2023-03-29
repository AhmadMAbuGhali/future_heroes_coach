class profile_model {
  String? id;
  String? email;
  String? imageString;
  String? fullName;
  bool? isActive;
  String? dateOfBirth;
  int? subCategoryId;
  SubCategory? subCategory;

  profile_model(
      {this.id,
      this.email,
      this.imageString,
      this.fullName,
      this.isActive,
      this.dateOfBirth,
      this.subCategoryId,
      this.subCategory});

  profile_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    imageString = json['imageString'];
    fullName = json['fullName'];
    isActive = json['isActive'];
    dateOfBirth = json['dateOfBirth'];
    subCategoryId = json['subCategoryId'];
    subCategory = json['subCategory'] != null
        ? new SubCategory.fromJson(json['subCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['imageString'] = this.imageString;
    data['fullName'] = this.fullName;
    data['isActive'] = this.isActive;
    data['dateOfBirth'] = this.dateOfBirth;
    data['subCategoryId'] = this.subCategoryId;
    if (this.subCategory != null) {
      data['subCategory'] = this.subCategory!.toJson();
    }
    return data;
  }
}

class SubCategory {
  String? name;
  int? categoryId;
  String? imageString;
  List<Coaches>? coaches;
  int? id;
  String? createdAt;
  String? updatedAt;

  SubCategory(
      {this.name,
      this.categoryId,
      this.imageString,
      this.coaches,
      this.id,
      this.createdAt,
      this.updatedAt});

  SubCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categoryId = json['categoryId'];
    imageString = json['imageString'];
    if (json['coaches'] != null) {
      coaches = <Coaches>[];
      json['coaches'].forEach((v) {
        coaches!.add(new Coaches.fromJson(v));
      });
    }
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['categoryId'] = this.categoryId;
    data['imageString'] = this.imageString;
    if (this.coaches != null) {
      data['coaches'] = this.coaches!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Coaches {
  String? email;
  String? userName;
  String? fullName;
  String? imageString;

  Coaches({this.email, this.userName, this.fullName, this.imageString});

  Coaches.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userName = json['userName'];
    fullName = json['fullName'];
    imageString = json['imageString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['fullName'] = this.fullName;
    data['imageString'] = this.imageString;
    return data;
  }
}
