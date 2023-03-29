class ComplaintReplay {
  String? title;
  String? subject;
  String? respone;
  int? id;
  String? createdAt;
  Null? updatedAt;

  ComplaintReplay(
      {this.title,
      this.subject,
      this.respone,
      this.id,
      this.createdAt,
      this.updatedAt});

  ComplaintReplay.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subject = json['subject'];
    respone = json['respone'];
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['subject'] = subject;
    data['respone'] = respone;
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
