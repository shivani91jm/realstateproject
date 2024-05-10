import 'package:realstateproject/Models/FilterModel/Aminities.dart';

class AminityData{
  int? id;
  String? categoryName;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Aminities>? aminities;

  AminityData(
      {this.id,
        this.categoryName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.aminities});

  AminityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['aminities'] != null) {
      aminities = <Aminities>[];
      json['aminities'].forEach((v) {
        aminities!.add(new Aminities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.aminities != null) {
      data['aminities'] = this.aminities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}