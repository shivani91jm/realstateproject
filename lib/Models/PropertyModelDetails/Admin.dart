class Admin {
  int? id;
  String? adminType;
  String? name;
  String? email;
  String? phone;
  String? image;
  Null? emailVerifiedAt;
  String? status;
  String? forgetPasswordToken;
  Null? forgetPasswordLink;
  String? slug;
  String? authorId;
  String? facebook;
  String? bannerImage;
  String? twitter;
  String? whatsapp;
  Null? instagram;
  String? linkedin;
  Null? pinterest;
  Null? youtube;
  String? address;
  String? about;
  String? website;
  Null? createdAt;
  String? updatedAt;

  Admin(
      {this.id,
        this.adminType,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.emailVerifiedAt,
        this.status,
        this.forgetPasswordToken,
        this.forgetPasswordLink,
        this.slug,
        this.authorId,
        this.facebook,
        this.bannerImage,
        this.twitter,
        this.whatsapp,
        this.instagram,
        this.linkedin,
        this.pinterest,
        this.youtube,
        this.address,
        this.about,
        this.website,
        this.createdAt,
        this.updatedAt});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminType = json['admin_type'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    forgetPasswordToken = json['forget_password_token'];
    forgetPasswordLink = json['forget_password_link'];
    slug = json['slug'];
    authorId = json['author_id'];
    facebook = json['facebook'];
    bannerImage = json['banner_image'];
    twitter = json['twitter'];
    whatsapp = json['whatsapp'];
    instagram = json['instagram'];
    linkedin = json['linkedin'];
    pinterest = json['pinterest'];
    youtube = json['youtube'];
    address = json['address'];
    about = json['about'];
    website = json['website'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_type'] = this.adminType;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['status'] = this.status;
    data['forget_password_token'] = this.forgetPasswordToken;
    data['forget_password_link'] = this.forgetPasswordLink;
    data['slug'] = this.slug;
    data['author_id'] = this.authorId;
    data['facebook'] = this.facebook;
    data['banner_image'] = this.bannerImage;
    data['twitter'] = this.twitter;
    data['whatsapp'] = this.whatsapp;
    data['instagram'] = this.instagram;
    data['linkedin'] = this.linkedin;
    data['pinterest'] = this.pinterest;
    data['youtube'] = this.youtube;
    data['address'] = this.address;
    data['about'] = this.about;
    data['website'] = this.website;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}