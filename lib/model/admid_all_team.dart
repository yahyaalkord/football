class AdminAllTeam {
  late int id;
  late String name;
  late String email;
  late String mobile;
   String? image;

  AdminAllTeam();

  AdminAllTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'];
  }

}