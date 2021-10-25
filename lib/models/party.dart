class Party{
  String partyUUID = "";
  String departure = "";
  String arrival = "";
  String description = "";
  String where = "";
  String when = "";
  String updatedAt = "";
  String createdAt = "";
  List<dynamic> users = [];


  Party(String partyUUID, String departure, String arrival, String description, String meetLocation, String where, String when, String createAt, String updateAt, List<String> users){
    this.partyUUID = partyUUID;
    this.departure = departure;
    this.arrival = arrival;
    this.description = description;
    this.where = where;
    this.when = when;
    this.updatedAt = updatedAt;
    this.createdAt = createdAt;
    this.users = users;
  }

  Party.fromJson(Map<String, dynamic> json)
      : partyUUID = json['id'],
        departure = json['departure'],
        arrival = json['arrival'],
        description = json['description'],
        where = json['where'],
        when = json['when'],
        updatedAt = json['updatedAt'],
        createdAt = json['createdAt'],
        users = json['users'];

  Map<String, dynamic> toJson() =>
      {
        'partyUUID' : partyUUID,
        'departure': departure,
        'arrival': arrival,
        'description': description,
        'where': where,
        'when': when,
        'updateAt': updatedAt,
        'createAt': createdAt,
        'users': users,
      };

  Map<String, dynamic> toMap() {
    return {
      'partyUUID' : partyUUID,
      'departure': departure,
      'arrival': arrival,
      'description': description,
      'where': where,
      'when': when,
      'updateAt': updatedAt,
      'createAt': createdAt,
      'users': users,
    };
  }
}