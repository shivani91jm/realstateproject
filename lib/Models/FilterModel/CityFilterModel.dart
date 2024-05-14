class CityFilterModel {
  int? id;
  String? name;
  String? zipcode;
  String? sname;

  CityFilterModel({this.id, this.name, this.zipcode, this.sname});

  CityFilterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    zipcode = json['zipcode'];
    sname = json['sname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['zipcode'] = this.zipcode;
    data['sname'] = this.sname;
    return data;
  }
}