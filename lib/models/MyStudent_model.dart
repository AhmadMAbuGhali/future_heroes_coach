class MyStudentModel {
  String? email;
  String? userName;
  String? fullName;
  String? imageString;
  String? membershipNo;

  MyStudentModel(
      {this.email,
      this.userName,
      this.fullName,
      this.imageString,
      this.membershipNo});

  MyStudentModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userName = json['userName'];
    fullName = json['fullName'];
    imageString = json['imageString'];
    membershipNo = json['membershipNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['fullName'] = this.fullName;
    data['imageString'] = this.imageString;
    data['membershipNo'] = this.membershipNo;
    return data;
  }
}
