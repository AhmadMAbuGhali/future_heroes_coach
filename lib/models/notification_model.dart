class NotificationModel {
  String? message;
  String? respone;
  int? id;


  NotificationModel(
      {this.message, this.respone, this.id });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    respone = json['respone'];
    id = json['id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['respone'] = this.respone;
    data['id'] = this.id;

    return data;
  }
}
