class RecaptchaSetting {
  int? id;
  String? siteKey;
  String? secretKey;
  String? status;
  Null? createdAt;
  String? updatedAt;

  RecaptchaSetting(
      {this.id,
        this.siteKey,
        this.secretKey,
        this.status,
        this.createdAt,
        this.updatedAt});

  RecaptchaSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteKey = json['site_key'];
    secretKey = json['secret_key'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site_key'] = this.siteKey;
    data['secret_key'] = this.secretKey;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}