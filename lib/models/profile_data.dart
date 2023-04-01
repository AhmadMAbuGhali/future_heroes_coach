class profile_model {
  String? email;
  String? imageString;
  String? fullName;
  bool? isActive;
  String? department;
  String? imageStringSubCatogrey;
  String? phoneNumber;
  String? dateOfBirth;

  profile_model(
      {this.email,
      this.imageString,
      this.fullName,
      this.isActive,
      this.department,
      this.imageStringSubCatogrey,
      this.phoneNumber,
      this.dateOfBirth});

  profile_model.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    imageString = json['imageString'];
    fullName = json['fullName'];
    isActive = json['isActive'];
    department = json['department'];
    imageStringSubCatogrey = json['imageStringSubCatogrey'];
    phoneNumber = json['phoneNumber'];
    dateOfBirth = json['dateOfBirth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['imageString'] = this.imageString;
    data['fullName'] = this.fullName;
    data['isActive'] = this.isActive;
    data['department'] = this.department;
    data['imageStringSubCatogrey'] = this.imageStringSubCatogrey;
    data['phoneNumber'] = this.phoneNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    return data;
  }
}
