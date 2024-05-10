class PropertyType {
  var id;
  var type;
  var slug;
  var status;
  var createdAt;
  var updatedAt;

  PropertyType(
      {this.id,
        this.type,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt});

  PropertyType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PropertyPurpose {
  int? id;
  String? purpose;
  String? customPurpose;
  String? slug;
  String? status;
  String? createdAt;
  String? updatedAt;

  PropertyPurpose(
      {this.id,
        this.purpose,
        this.customPurpose,
        this.slug,
        this.status,
        this.createdAt,
        this.updatedAt});

  PropertyPurpose.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purpose = json['purpose'];
    customPurpose = json['custom_purpose'];
    slug = json['slug'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['purpose'] = this.purpose;
    data['custom_purpose'] = this.customPurpose;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}