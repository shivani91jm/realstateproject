class Data {
  int? id;
  String? name;
  var type;
  String? slug;

  Data({required this.id, required this.name, required this.type, this.slug});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['slug'] = this.slug;
    return data;
  }
}