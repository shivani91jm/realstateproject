import 'package:realstateproject/Models/FilterModel/PropertyType.dart';
class SearchFilter {
  List<PropertyType>? propertyTypes;

  SearchFilter({this.propertyTypes});

  SearchFilter.fromJson(Map<String, dynamic> json) {
    if (json['propertyTypes'] != null) {
      propertyTypes = <PropertyType>[];
      json['propertyTypes'].forEach((v) {
        propertyTypes!.add(new PropertyType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.propertyTypes != null) {
      data['propertyTypes'] =
          this.propertyTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
