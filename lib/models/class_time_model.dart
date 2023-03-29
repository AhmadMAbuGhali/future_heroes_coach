class ClassTime {
  ClassLecture? classLecture;
  String? classStart;
  String? classEnd;
  String? startTime;
  String? endTime;
  String? duration;
  int? day;
  int? id;
  String? createdAt;

  ClassTime({
    this.classLecture,
    this.classStart,
    this.classEnd,
    this.startTime,
    this.endTime,
    this.duration,
    this.day,
    this.id,
    this.createdAt,
  });

  ClassTime.fromJson(Map<String, dynamic> json) {
    classLecture = json['classLecture'] != null
        ? ClassLecture.fromJson(json['classLecture'])
        : null;
    classStart = json['classStart'];
    classEnd = json['classEnd'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    duration = json['duration'];
    day = json['day'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (classLecture != null) {
      data['classLecture'] = classLecture!.toJson();
    }
    data['classStart'] = classStart;
    data['classEnd'] = classEnd;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['duration'] = duration;
    data['day'] = day;
    data['id'] = id;
    data['createdAt'] = createdAt;
    return data;
  }
}

class ClassLecture {
  String? name;
  String? description;
  int? maxPlayers;
  String? coachName;

  ClassLecture({this.name, this.description, this.maxPlayers, this.coachName});

  ClassLecture.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    maxPlayers = json['maxPlayers'];
    coachName = json['coachName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['maxPlayers'] = maxPlayers;
    data['coachName'] = coachName;
    return data;
  }
}
