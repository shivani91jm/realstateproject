import 'package:realstateproject/Models/PropertyModelDetails/AuthImages.dart';
import 'package:realstateproject/Models/PropertyModelDetails/Property.dart';
import 'package:realstateproject/Models/PropertyModelDetails/PropertyReviews.dart';
import 'package:realstateproject/Models/PropertyModelDetails/RecaptchaSetting.dart';
import 'package:realstateproject/Models/PropertyModelDetails/SimilarProperties.dart';

class PropertyDetailsModelClass {
  var bannerImage;
  Property? property;
  //  var defaultImage;
  //  var currency;
  // RecaptchaSetting? recaptchaSetting;
  // List<String>? propertyaminitiesArr;
  // List<SimilarProperties>? similarProperties;
  // PropertyReviews? propertyReviews;
  // AuthImages? authImages;

  PropertyDetailsModelClass(
      {this.bannerImage,
        this.property,
        // this.defaultImage,
        // this.currency,
        // this.recaptchaSetting,
        // this.propertyaminitiesArr,
        // this.similarProperties,
        // this.propertyReviews,
        // this.authImages
      });

  PropertyDetailsModelClass.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    // defaultImage = json['default_image'];
    // currency = json['currency'];
    // recaptchaSetting = json['recaptcha_setting'] != null
    //     ? new RecaptchaSetting.fromJson(json['recaptcha_setting'])
    //     : null;
    // propertyaminitiesArr = json['propertyaminities_arr'].cast<String>();
    // if (json['similarProperties'] != null) {
    //   similarProperties = <SimilarProperties>[];
    //   json['similarProperties'].forEach((v) {
    //     similarProperties!.add(new SimilarProperties.fromJson(v));
    //   });
    // }
    // propertyReviews = json['propertyReviews'] != null
    //     ? new PropertyReviews.fromJson(json['propertyReviews'])
    //     : null;
    // authImages = json['auth_images'] != null
    //     ? new AuthImages.fromJson(json['auth_images'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_image'] = this.bannerImage;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    // data['default_image'] = this.defaultImage;
    // data['currency'] = this.currency;
    // if (this.recaptchaSetting != null) {
    //   data['recaptcha_setting'] = this.recaptchaSetting!.toJson();
    // }
    // data['propertyaminities_arr'] = this.propertyaminitiesArr;
    // if (this.similarProperties != null) {
    //   data['similarProperties'] =
    //       this.similarProperties!.map((v) => v.toJson()).toList();
    // }
    // if (this.propertyReviews != null) {
    //   data['propertyReviews'] = this.propertyReviews!.toJson();
    // }
    // if (this.authImages != null) {
    //   data['auth_images'] = this.authImages!.toJson();
    // }
    return data;
  }
}