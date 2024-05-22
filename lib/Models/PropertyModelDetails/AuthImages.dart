class AuthImages {
  String? adminImg;
  Null? userImg;

  AuthImages({this.adminImg, this.userImg});

  AuthImages.fromJson(Map<String, dynamic> json) {
    adminImg = json['admin_img'];
    userImg = json['user_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin_img'] = this.adminImg;
    data['user_img'] = this.userImg;
    return data;
  }
}