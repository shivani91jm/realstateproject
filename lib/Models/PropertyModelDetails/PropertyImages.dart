class PropertyImages {
  int? id;
  String? propertyId;
  String? image;
  String? createdAt;
  String? updatedAt;

  PropertyImages(
      {this.id, this.propertyId, this.image, this.createdAt, this.updatedAt});

  PropertyImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['property_id'] = this.propertyId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}