class Party{
  String departure = "";
  String arrival = "";
  String description = "";
  String meetLocation = "";
  String meetAt = "";
  String updateAt = "";
  String createAt = "";
  String users = "";


  Party(String departure, String arrival, String description, String meetLocation, String meetAt, String updateAt, String createAt, String users){
    this.departure = departure;
    this.arrival = arrival;
    this.description = description;
    this.meetLocation = meetLocation;
    this.meetAt = meetAt;
    this.updateAt = updateAt;
    this.createAt = createAt;
    this.users = users;
  }
}