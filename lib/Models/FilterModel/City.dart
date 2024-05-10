class City {
  int? id;
  String? countryStateId;
  String? name;
  String? slug;
  String? latitude;
  String? longitude;
  String? status;
  String? stateId;
  String? zipcode;
  String? createdAt;
  String? updatedAt;

  City(
      {this.id,
        this.countryStateId,
        this.name,
        this.slug,
        this.latitude,
        this.longitude,
        this.status,
        this.stateId,
        this.zipcode,
        this.createdAt,
        this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryStateId = json['country_state_id'];
    name = json['name'];
    slug = json['slug'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    stateId = json['state_id'];
    zipcode = json['zipcode'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_state_id'] = this.countryStateId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['state_id'] = this.stateId;
    data['zipcode'] = this.zipcode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
