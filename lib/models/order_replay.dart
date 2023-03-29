class OrderReplay {
  String? title;
  String? subject;
  String? respone;
  UserOrderOfferRespone? userOrderOfferRespone;
  int? id;
  String? createdAt;
  Null? updatedAt;

  OrderReplay(
      {this.title,
      this.subject,
      this.respone,
      this.userOrderOfferRespone,
      this.id,
      this.createdAt,
      this.updatedAt});

  OrderReplay.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subject = json['subject'];
    respone = json['respone'];
    userOrderOfferRespone = json['userOrderOfferRespone'] != null
        ? new UserOrderOfferRespone.fromJson(json['userOrderOfferRespone'])
        : null;
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['subject'] = subject;
    data['respone'] = respone;
    if (userOrderOfferRespone != null) {
      data['userOrderOfferRespone'] = userOrderOfferRespone!.toJson();
    }
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class UserOrderOfferRespone {
  int? duration;
  int? price;
  String? endDate;

  UserOrderOfferRespone({this.duration, this.price, this.endDate});

  UserOrderOfferRespone.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    price = json['price'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = duration;
    data['price'] = price;
    data['endDate'] = endDate;
    return data;
  }
}
