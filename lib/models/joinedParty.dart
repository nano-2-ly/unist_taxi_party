class JoinedParty{
  String joinedPartyUUID = "";
  String uid = "";
  String partyUUID = "";
  bool available = false;



  JoinedParty(String joinedPartyUUID, String uid, String partyUUID, bool available, String meetLocation, String where, String when, String createAt, String updateAt, List<String> users){
    this.joinedPartyUUID = joinedPartyUUID;
    this.uid = uid;
    this.partyUUID = partyUUID;
    this.available = available;

  }

  JoinedParty.fromJson(Map<String, dynamic> json)
      : joinedPartyUUID = json['id'],
        uid = json['uid'],
        partyUUID = json['partyUUID'],
        available = json['available'];

  Map<String, dynamic> toJson() =>
      {
        'joinedPartyUUID' : joinedPartyUUID,
        'uid': uid,
        'partyUUID': partyUUID,
        'available': available,
      };

  Map<String, dynamic> toMap() {
    return {
      'joinedPartyUUID' : joinedPartyUUID,
      'uid': uid,
      'partyUUID': partyUUID,
      'available': available,
    };
  }
}