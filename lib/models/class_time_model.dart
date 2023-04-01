class ClassTime {
  int? id;
  String? startClass;
  String? endClass;
  int? day;
  String? dayAsString;
  String? department;

  ClassTime(
      {this.id,
      this.startClass,
      this.endClass,
      this.day,
      this.dayAsString,
      this.department});

  ClassTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startClass = json['startClass'];
    endClass = json['endClass'];
    day = json['day'];
    dayAsString = json['dayAsString'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startClass'] = this.startClass;
    data['endClass'] = this.endClass;
    data['day'] = this.day;
    data['dayAsString'] = this.dayAsString;
    data['department'] = this.department;
    return data;
  }
}
