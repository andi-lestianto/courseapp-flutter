class UserModel {
  int? iduser;
  String? email;
  String? name;
  String? password;
  String? pict;

  UserModel({this.iduser, this.email, this.name, this.password, this.pict});

  UserModel.fromJson(Map<String, dynamic> json) {
    iduser = json['iduser'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    pict = json['pict'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iduser'] = this.iduser;
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['pict'] = this.pict;
    return data;
  }
}
