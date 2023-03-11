class Profile {
  String email;
  String password;
  String phone;
  String username;

  Profile({this.email, this.password, this.phone, this.username});

  // Profile.fromJson(Map<String, dynamic> json) {
  //   email = json['email'];
  //   password = json['password'];
  //   phone = json['phone'];
  //   username = json['username'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['email'] = this.email;
  //   data['password'] = this.password;
  //   data['phone'] = this.phone;
  //   data['username'] = this.username;
  //   return data;
  // }
}
