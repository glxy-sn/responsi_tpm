class MatchesModel {
  String? id;
  String? venue;
  String? location;
  String? status;
  String? stageName;
  String? time;
  TimeExtraInfo? timeExtraInfo;
  HomeTeam? homeTeam;
  AwayTeam? awayTeam;
  List<Officials>? officials;
  String? createdAt;
  String? date;
  String? updatedAt;
  String? winner;
  int? matchNumber;

  MatchesModel({
    this.id,
    this.venue,
    this.location,
    this.status,
    this.stageName,
    this.time,
    this.timeExtraInfo,
    this.homeTeam,
    this.awayTeam,
    this.officials,
    this.createdAt,
    this.date,
    this.updatedAt,
    this.winner,
    this.matchNumber,
  });

  MatchesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    venue = json['venue'] as String?;
    location = json['location'] as String?;
    status = json['status'] as String?;
    stageName = json['stageName'] as String?;
    time = json['time'] as String?;
    timeExtraInfo = (json['timeExtraInfo'] as Map<String,dynamic>?) != null ? TimeExtraInfo.fromJson(json['timeExtraInfo'] as Map<String,dynamic>) : null;
    homeTeam = (json['homeTeam'] as Map<String,dynamic>?) != null ? HomeTeam.fromJson(json['homeTeam'] as Map<String,dynamic>) : null;
    awayTeam = (json['awayTeam'] as Map<String,dynamic>?) != null ? AwayTeam.fromJson(json['awayTeam'] as Map<String,dynamic>) : null;
    officials = (json['officials'] as List?)?.map((dynamic e) => Officials.fromJson(e as Map<String,dynamic>)).toList();
    createdAt = json['createdAt'] as String?;
    date = json['date'] as String?;
    updatedAt = json['updatedAt'] as String?;
    winner = json['winner'] as String?;
    matchNumber = json['matchNumber'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['venue'] = venue;
    json['location'] = location;
    json['status'] = status;
    json['stageName'] = stageName;
    json['time'] = time;
    json['timeExtraInfo'] = timeExtraInfo?.toJson();
    json['homeTeam'] = homeTeam?.toJson();
    json['awayTeam'] = awayTeam?.toJson();
    json['officials'] = officials?.map((e) => e.toJson()).toList();
    json['createdAt'] = createdAt;
    json['date'] = date;
    json['updatedAt'] = updatedAt;
    json['winner'] = winner;
    json['matchNumber'] = matchNumber;
    return json;
  }
}

class TimeExtraInfo {
  String? current;
  dynamic firstHalfTime;
  dynamic firstHalfExtraTime;
  dynamic secondHalfTime;
  dynamic secondHalfExtraTime;

  TimeExtraInfo({
    this.current,
    this.firstHalfTime,
    this.firstHalfExtraTime,
    this.secondHalfTime,
    this.secondHalfExtraTime,
  });

  TimeExtraInfo.fromJson(Map<String, dynamic> json) {
    current = json['current'] as String?;
    firstHalfTime = json['firstHalfTime'];
    firstHalfExtraTime = json['firstHalfExtraTime'];
    secondHalfTime = json['secondHalfTime'];
    secondHalfExtraTime = json['secondHalfExtraTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['current'] = current;
    json['firstHalfTime'] = firstHalfTime;
    json['firstHalfExtraTime'] = firstHalfExtraTime;
    json['secondHalfTime'] = secondHalfTime;
    json['secondHalfExtraTime'] = secondHalfExtraTime;
    return json;
  }
}

class HomeTeam {
  String? country;
  int? goals;
  String? name;
  int? penalties;

  HomeTeam({
    this.country,
    this.goals,
    this.name,
    this.penalties,
  });

  HomeTeam.fromJson(Map<String, dynamic> json) {
    country = json['country'] as String?;
    goals = json['goals'] as int?;
    name = json['name'] as String?;
    penalties = json['penalties'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['country'] = country;
    json['goals'] = goals;
    json['name'] = name;
    json['penalties'] = penalties;
    return json;
  }
}

class AwayTeam {
  String? country;
  int? goals;
  String? name;
  int? penalties;

  AwayTeam({
    this.country,
    this.goals,
    this.name,
    this.penalties,
  });

  AwayTeam.fromJson(Map<String, dynamic> json) {
    country = json['country'] as String?;
    goals = json['goals'] as int?;
    name = json['name'] as String?;
    penalties = json['penalties'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['country'] = country;
    json['goals'] = goals;
    json['name'] = name;
    json['penalties'] = penalties;
    return json;
  }
}

class Officials {
  String? name;
  String? role;
  String? country;

  Officials({
    this.name,
    this.role,
    this.country,
  });

  Officials.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    role = json['role'] as String?;
    country = json['country'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['role'] = role;
    json['country'] = country;
    return json;
  }
}