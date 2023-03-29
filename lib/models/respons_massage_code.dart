class ResponsMassageCode {
  String? message;

  ResponsMassageCode({this.message});
  ResponsMassageCode.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

}
