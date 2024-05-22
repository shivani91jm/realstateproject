class DetailsModel {
  var id;
  var name;
  var slug;
  var email;
  var phone;
  var image;
  var about;
  var cityId;
 var iconOne;
  var linkOne;
  var iconTwo;
  var linkTwo;
  var iconThree;
  var linkThree;
  var iconFour;
  var linkFour;
  var emailVerifiedToken;
  var emailVerified;
  var forgetPasswordToken;
  var status;
  var website;
  var address;
  var bannerImage;
  var providerId;
  var provider;
  var providerAvatar;
  var badgeId;
  var createdAt;
  var updatedAt;

  DetailsModel(
      {this.id,
        this.name,
        this.slug,
        this.email,
        this.phone,
        this.image,
        this.about,
        this.cityId,
        this.iconOne,
        this.linkOne,
        this.iconTwo,
        this.linkTwo,
        this.iconThree,
        this.linkThree,
        this.iconFour,
        this.linkFour,
        this.emailVerifiedToken,
        this.emailVerified,
        this.forgetPasswordToken,
        this.status,
        this.website,
        this.address,
        this.bannerImage,
        this.providerId,
        this.provider,
        this.providerAvatar,
        this.badgeId,
        this.createdAt,
        this.updatedAt});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    about = json['about'];
    cityId = json['city_id'];
    iconOne = json['icon_one'];
    linkOne = json['link_one'];
    iconTwo = json['icon_two'];
    linkTwo = json['link_two'];
    iconThree = json['icon_three'];
    linkThree = json['link_three'];
    iconFour = json['icon_four'];
    linkFour = json['link_four'];
    emailVerifiedToken = json['email_verified_token'];
    emailVerified = json['email_verified'];
    forgetPasswordToken = json['forget_password_token'];
    status = json['status'];
    website = json['website'];
    address = json['address'];
    bannerImage = json['banner_image'];
    providerId = json['provider_id'];
    provider = json['provider'];
    providerAvatar = json['provider_avatar'];
    badgeId = json['badge_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['about'] = this.about;
    data['city_id'] = this.cityId;
    data['icon_one'] = this.iconOne;
    data['link_one'] = this.linkOne;
    data['icon_two'] = this.iconTwo;
    data['link_two'] = this.linkTwo;
    data['icon_three'] = this.iconThree;
    data['link_three'] = this.linkThree;
    data['icon_four'] = this.iconFour;
    data['link_four'] = this.linkFour;
    data['email_verified_token'] = this.emailVerifiedToken;
    data['email_verified'] = this.emailVerified;
    data['forget_password_token'] = this.forgetPasswordToken;
    data['status'] = this.status;
    data['website'] = this.website;
    data['address'] = this.address;
    data['banner_image'] = this.bannerImage;
    data['provider_id'] = this.providerId;
    data['provider'] = this.provider;
    data['provider_avatar'] = this.providerAvatar;
    data['badge_id'] = this.badgeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}