import 'package:realstateproject/Models/FilterModel/Aminities.dart';
import 'package:realstateproject/Models/Search/AninitiesData.dart';

class AminitiesModel {
  List<AminityData>? data;

  AminitiesModel({this.data});

  AminitiesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <AminityData>[];
      json['data'].forEach((v) {
        data!.add(new AminityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
