class Aminities {
  bool flag=false;
  int? id;
  var aminity;
  var slug;
  var category;
  var status;
  var createdAt;
  var updatedAt;

  Aminities(

      {required this.flag,
        this.id,
        this.aminity,
        this.slug,
        this.category,
        this.status,
        this.createdAt,
        this.updatedAt});

  Aminities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aminity = json['aminity'];
    slug = json['slug'];
    category = json['category'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['aminity'] = this.aminity;
    data['slug'] = this.slug;
    data['category'] = this.category;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}