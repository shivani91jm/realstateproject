class Buying {
  String? img;
  String? title;
  String? desc;
 // Link? link;

  Buying({this.img, this.title, this.desc,
    //this.link
  });

  Buying.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    title = json['title'];
    desc = json['desc'];
   // link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['title'] = this.title;
    data['desc'] = this.desc;
    // if (this.link != null) {
    //   data['link'] = this.link!.toJson();
    // }
    return data;
  }
}