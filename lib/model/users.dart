class AdminModel {
  late int id;
  late String name;
  late String email;
  late String token;

  AdminModel();

  AdminModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
  }

}
class PlayerModel {
  late int id;
  late int teamId;
  late String name;
  late String email;
  late String nationality;
   String? image;
  late String birthDate;
  late String startDate;
  late String endDate;
   String? file;
  late int rate;
  late String type;
   String? specialization;
  late String token;

  PlayerModel();

  PlayerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    name = json['name'];
    email = json['email'];
    nationality = json['nationality'];
    image = json['image'];
    birthDate = json['birth_date'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    file = json['file'];
    rate = json['rate'];
    type = json['type'];
    specialization = json['Specialization'];
    token = json['token'];
  }

}
class TeamModel {
  late int id;
  late String name;
  late String email;
  late String mobile;
   String? image;
  late String token;
  late int matchesCount;
  late int violationsCount;

  TeamModel();

  TeamModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'];
    if(json.containsKey('token')){
      token = json['token'];
    }
    if(json.containsKey('matches_count')){
      matchesCount = json['matches_count'];
    }
    if(json.containsKey('violations_count')){
      violationsCount = json['violations_count'];
    }

  }

}
class VisitorModel {
  late int id;
  late String name;
  late String email;
  late String mobile;
   String? image;
  late String token;
  late String imageUrl;

  VisitorModel();

  VisitorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'];
    if(json.containsKey('token')){
      token = json['token'];
    }

    imageUrl = json['image_url'];
  }

}