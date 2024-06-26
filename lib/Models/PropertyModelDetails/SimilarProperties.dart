class SimilarProperties {
  int? id;
  String? propertySearchId;
  String? userType;
  String? adminId;
  String? userId;
  String? propertyTypeId;
  String? cityId;
  String? zipcode;
  String? stateId;
  String? listingPackageId;
  String? propertyPurposeId;
  String? title;
  String? slug;
  String? views;
  String? address;
  String? phone;
  String? email;
  String? website;
  String? description;
  Null? file;
  String? thumbnailImage;
  String? bannerImage;
  String? numberOfUnit;
  String? numberOfRoom;
  String? numberOfBedroom;
  String? numberOfBathroom;
  String? numberOfFloor;
  String? numberOfKitchen;
  String? numberOfParking;
  String? transactionType;
  String? facing;
  String? furnishedStatus;
  String? typeOfOwnership;
  String? ageOfConstruction;
  String? flooring;
  String? area;
  String? googleMapEmbedCode;
  String? price;
  String? period;
  String? videoLink;
  String? isFeatured;
  String? verified;
  String? topProperty;
  String? urgentProperty;
  String? status;
  String? seoTitle;
  String? expiredDate;
  String? seoDescription;
  String? saleMethod;
  String? establishedProperty;
  String? createdAt;
  String? updatedAt;
  String? averageRating;

  SimilarProperties(
      {this.id,
        this.propertySearchId,
        this.userType,
        this.adminId,
        this.userId,
        this.propertyTypeId,
        this.cityId,
        this.zipcode,
        this.stateId,
        this.listingPackageId,
        this.propertyPurposeId,
        this.title,
        this.slug,
        this.views,
        this.address,
        this.phone,
        this.email,
        this.website,
        this.description,
        this.file,
        this.thumbnailImage,
        this.bannerImage,
        this.numberOfUnit,
        this.numberOfRoom,
        this.numberOfBedroom,
        this.numberOfBathroom,
        this.numberOfFloor,
        this.numberOfKitchen,
        this.numberOfParking,
        this.transactionType,
        this.facing,
        this.furnishedStatus,
        this.typeOfOwnership,
        this.ageOfConstruction,
        this.flooring,
        this.area,
        this.googleMapEmbedCode,
        this.price,
        this.period,
        this.videoLink,
        this.isFeatured,
        this.verified,
        this.topProperty,
        this.urgentProperty,
        this.status,
        this.seoTitle,
        this.expiredDate,
        this.seoDescription,
        this.saleMethod,
        this.establishedProperty,
        this.createdAt,
        this.updatedAt,
        this.averageRating});

  SimilarProperties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertySearchId = json['property_search_id'];
    userType = json['user_type'];
    adminId = json['admin_id'];
    userId = json['user_id'];
    propertyTypeId = json['property_type_id'];
    cityId = json['city_id'];
    zipcode = json['zipcode'];
    stateId = json['state_id'];
    listingPackageId = json['listing_package_id'];
    propertyPurposeId = json['property_purpose_id'];
    title = json['title'];
    slug = json['slug'];
    views = json['views'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    website = json['website'];
    description = json['description'];
    file = json['file'];
    thumbnailImage = json['thumbnail_image'];
    bannerImage = json['banner_image'];
    numberOfUnit = json['number_of_unit'];
    numberOfRoom = json['number_of_room'];
    numberOfBedroom = json['number_of_bedroom'];
    numberOfBathroom = json['number_of_bathroom'];
    numberOfFloor = json['number_of_floor'];
    numberOfKitchen = json['number_of_kitchen'];
    numberOfParking = json['number_of_parking'];
    transactionType = json['transaction_type'];
    facing = json['facing'];
    furnishedStatus = json['furnished_status'];
    typeOfOwnership = json['type_of_ownership'];
    ageOfConstruction = json['age_of_construction'];
    flooring = json['flooring'];
    area = json['area'];
    googleMapEmbedCode = json['google_map_embed_code'];
    price = json['price'];
    period = json['period'];
    videoLink = json['video_link'];
    isFeatured = json['is_featured'];
    verified = json['verified'];
    topProperty = json['top_property'];
    urgentProperty = json['urgent_property'];
    status = json['status'];
    seoTitle = json['seo_title'];
    expiredDate = json['expired_date'];
    seoDescription = json['seo_description'];
    saleMethod = json['sale_method'];
    establishedProperty = json['established_property'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_search_id'] = this.propertySearchId;
    data['user_type'] = this.userType;
    data['admin_id'] = this.adminId;
    data['user_id'] = this.userId;
    data['property_type_id'] = this.propertyTypeId;
    data['city_id'] = this.cityId;
    data['zipcode'] = this.zipcode;
    data['state_id'] = this.stateId;
    data['listing_package_id'] = this.listingPackageId;
    data['property_purpose_id'] = this.propertyPurposeId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['views'] = this.views;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['website'] = this.website;
    data['description'] = this.description;
    data['file'] = this.file;
    data['thumbnail_image'] = this.thumbnailImage;
    data['banner_image'] = this.bannerImage;
    data['number_of_unit'] = this.numberOfUnit;
    data['number_of_room'] = this.numberOfRoom;
    data['number_of_bedroom'] = this.numberOfBedroom;
    data['number_of_bathroom'] = this.numberOfBathroom;
    data['number_of_floor'] = this.numberOfFloor;
    data['number_of_kitchen'] = this.numberOfKitchen;
    data['number_of_parking'] = this.numberOfParking;
    data['transaction_type'] = this.transactionType;
    data['facing'] = this.facing;
    data['furnished_status'] = this.furnishedStatus;
    data['type_of_ownership'] = this.typeOfOwnership;
    data['age_of_construction'] = this.ageOfConstruction;
    data['flooring'] = this.flooring;
    data['area'] = this.area;
    data['google_map_embed_code'] = this.googleMapEmbedCode;
    data['price'] = this.price;
    data['period'] = this.period;
    data['video_link'] = this.videoLink;
    data['is_featured'] = this.isFeatured;
    data['verified'] = this.verified;
    data['top_property'] = this.topProperty;
    data['urgent_property'] = this.urgentProperty;
    data['status'] = this.status;
    data['seo_title'] = this.seoTitle;
    data['expired_date'] = this.expiredDate;
    data['seo_description'] = this.seoDescription;
    data['sale_method'] = this.saleMethod;
    data['established_property'] = this.establishedProperty;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['averageRating'] = this.averageRating;
    return data;
  }
}