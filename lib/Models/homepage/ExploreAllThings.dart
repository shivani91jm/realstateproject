import 'package:realstateproject/Models/homepage/Buying.dart';

class ExploreAllThings {
  String? name;
  String? img;
  String? title;
  String? desc;
  // Link? link;

  ExploreAllThings({this.name,this.img, this.title, this.desc,
    //this.link
  });

  ExploreAllThings.fromJson(Map<String, dynamic> json) {
    name= json['name'];
    img = json['img'];
    title = json['title'];
    desc = json['desc'];
    // link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] =this.name;
    data['img'] = this.img;
    data['title'] = this.title;
    data['desc'] = this.desc;
    // if (this.link != null) {
    //   data['link'] = this.link!.toJson();
    // }
    return data;
  }


}