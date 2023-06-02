class UserModel {
  int? iduser;
  String? email;
  String? name;
  String? password;

  UserModel({this.iduser, this.email, this.name, this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    iduser = json['iduser'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iduser'] = this.iduser;
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    return data;
  }
}
