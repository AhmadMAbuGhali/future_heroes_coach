class TimeList {
  int? id;
  int? subCategoryId;
  List<ClassDateTimes>? classDateTimes;

  TimeList({this.id, this.classDateTimes});

  TimeList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['subCategoryId'];
    if (json['classDateTimes'] != null) {
      classDateTimes = <ClassDateTimes>[];
      json['classDateTimes'].forEach((v) {
        classDateTimes!.add(ClassDateTimes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subCategoryId'] = subCategoryId;
    if (classDateTimes != null) {
      data['classDateTimes'] = classDateTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClassDateTimes {
  String? startClass;
  String? endClass;
  String? duration;
  int? day;
  String? dayAsString;
  String? dayAsStringsEN;

  ClassDateTimes(
      {this.startClass,
      this.endClass,
      this.duration,
      this.day,
      this.dayAsString,
      this.dayAsStringsEN});

  ClassDateTimes.fromJson(Map<String, dynamic> json) {
    startClass = json['startClass'];
    endClass = json['endClass'];
    duration = json['duration'];
    day = json['day'];
    dayAsString = json['dayAsString'];
    dayAsStringsEN = json['dayAsStringsEN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startClass'] = startClass;
    data['endClass'] = endClass;
    data['duration'] = duration;
    data['day'] = day;
    data['dayAsString'] = dayAsString;
    data['dayAsStringsEN'] = dayAsStringsEN;
    return data;
  }
}
