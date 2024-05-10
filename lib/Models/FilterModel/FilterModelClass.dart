import 'package:realstateproject/Models/FilterModel/Aminities.dart';
import 'package:realstateproject/Models/FilterModel/Properties.dart';

class FilterModelClass {
  Properties? properties;
  List<Aminities>? aminities;

  var bannerImage;
  var pageType;
  var currency;
 // List<PropertyTypes>? propertyTypes;
  //List<Cities>? cities;
  var priceRange;
  var modPrice;
  var minimumPrice;
 var maxNumberOfRoom;

  FilterModelClass(
      {this.properties,
        this.aminities,

        this.bannerImage,
        this.pageType,
        this.currency,
      //  this.propertyTypes,
      //  this.cities,
        this.priceRange,
        this.modPrice,
        this.minimumPrice,
        this.maxNumberOfRoom});

  FilterModelClass.fromJson(Map<String, dynamic> json) {
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    if (json['aminities'] != null) {
      aminities = <Aminities>[];
      json['aminities'].forEach((v) {
        aminities!.add(new Aminities.fromJson(v));
      });
    }

    bannerImage = json['banner_image'];
    pageType = json['page_type'];
    currency = json['currency'];
    // if (json['propertyTypes'] != null) {
    //   propertyTypes = <PropertyTypes>[];
    //   json['propertyTypes'].forEach((v) {
    //     propertyTypes!.add(new PropertyTypes.fromJson(v));
    //   });
    // }
    // if (json['cities'] != null) {
    //   cities = <Cities>[];
    //   json['cities'].forEach((v) {
    //     cities!.add(new Cities.fromJson(v));
    //   });
    // }
    priceRange = json['price_range'];
    modPrice = json['mod_price'];
    minimumPrice = json['minimum_price'];
    maxNumberOfRoom = json['max_number_of_room'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    if (this.aminities != null) {
      data['aminities'] = this.aminities!.map((v) => v.toJson()).toList();
    }

    data['banner_image'] = this.bannerImage;
    data['page_type'] = this.pageType;
    data['currency'] = this.currency;
    // if (this.propertyTypes != null) {
    //   data['propertyTypes'] =
    //       this.propertyTypes!.map((v) => v.toJson()).toList();
    // }
    // if (this.cities != null) {
    //   data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    // }
    data['price_range'] = this.priceRange;
    data['mod_price'] = this.modPrice;
    data['minimum_price'] = this.minimumPrice;
    data['max_number_of_room'] = this.maxNumberOfRoom;
    return data;
  }
}