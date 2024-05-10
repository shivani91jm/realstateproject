import 'package:realstateproject/Models/homepage/Blogs.dart';
import 'package:realstateproject/Models/homepage/ExploreAllThings.dart';

class HomeData {
 // List<Sliders>? sliders;
  List<ExploreAllThings>? exploreAllThings;
  Blogs? blogs;

   HomeData({
     //this.sliders,
     this.exploreAllThings,
     this.blogs
   });
   HomeData.fromJson(Map<String, dynamic> json) {
    // if (json['sliders'] != null) {
    //   sliders = <Sliders>[];
    //   json['sliders'].forEach((v) {
    //     sliders!.add(new Sliders.fromJson(v));
    //   });
    // }
    if (json['explore_all_things'] != null) {
      exploreAllThings = <ExploreAllThings>[];
      json['explore_all_things'].forEach((v) {
        exploreAllThings!.add(new ExploreAllThings.fromJson(v));
      });
    }
    blogs = json['blogs'] != null ? new Blogs.fromJson(json['blogs']) : null;
  }
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.sliders != null) {
    //   data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
    // }
    if (this.exploreAllThings != null) {
      data['explore_all_things'] =
          this.exploreAllThings!.map((v) => v.toJson()).toList();
    }
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.toJson();
    }
    return data;
  }
}