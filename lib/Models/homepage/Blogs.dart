import 'package:realstateproject/Models/homepage/BlogsData.dart';

class Blogs {
  bool? blogVisibility;
  String? title;
  String? description;
  List<BlogsData>? blogs;

  Blogs({this.blogVisibility, this.title, this.description, this.blogs});

  Blogs.fromJson(Map<String, dynamic> json) {
    blogVisibility = json['blog_visibility'];
    title = json['title'];
    description = json['description'];
    if (json['blogs'] != null) {
      blogs = <BlogsData>[];
      json['blogs'].forEach((v) {
        blogs!.add(new BlogsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_visibility'] = this.blogVisibility;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}