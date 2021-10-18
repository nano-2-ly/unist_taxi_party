class Chat{
  String chatUUID = "";
  String partyUUID = "";
  String uid = "";
  String createAt = "";
  String content = "";


  Chat(String chatUuID, String partyUUID, String uid, String createAt, String content){
    this.chatUUID = chatUuID;
    this.partyUUID = partyUUID;
    this.uid = uid;
    this.createAt = createAt;
    this.content = content;
  }


  Chat.fromJson(Map<String, dynamic> json)
      : chatUUID = json['chatUUID'],
        partyUUID = json['partyUUID'],
        uid = json['uid'],
        createAt = json['createAt'],
        content = json['content'];

  Map<String, dynamic> toJson() =>
      {
        'chatUUID' : chatUUID,
        'partyUUID': partyUUID,
        'uid': uid,
        'createAt': createAt,
        'content': content,
      };

  Map<String, dynamic> toMap() {
    return {
      'chatUUID': chatUUID,
      'partyUUID': partyUUID,
      'uid': uid,
      'createAt': createAt,
      'content': content,
    };
  }
}