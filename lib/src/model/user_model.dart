class User {
  String? email;
  String? pass;
  String? token;
  String? msg;

  User(this.email, this.pass, this.token, this.msg);

  User.fromJson(Map<String, dynamic> json) {
    //id = json['_id'];
    //name = json['name'];
    email = json['email'];
    pass = json['password'];
    token = json['token'];
    msg = json['msg'];
  }
}
