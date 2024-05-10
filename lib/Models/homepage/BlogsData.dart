class BlogsData {
  int? id;
  String? adminId;
  String? title;
  String? slug;
  String? blogCategoryId;
  String? image;
  String? description;
  String? shortDescription;
  String? views;
  String? seoTitle;
  String? seoDescription;
  String? status;
  String? showHomepage;
  String? createdAt;
  String? updatedAt;
  int? totalComment;

  BlogsData(
      {this.id,
        this.adminId,
        this.title,
        this.slug,
        this.blogCategoryId,
        this.image,
        this.description,
        this.shortDescription,
        this.views,
        this.seoTitle,
        this.seoDescription,
        this.status,
        this.showHomepage,
        this.createdAt,
        this.updatedAt,
        this.totalComment});

  BlogsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adminId = json['admin_id'];
    title = json['title'];
    slug = json['slug'];
    blogCategoryId = json['blog_category_id'];
    image = json['image'];
    description = json['description'];
    shortDescription = json['short_description'];
    views = json['views'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    status = json['status'];
    showHomepage = json['show_homepage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalComment = json['totalComment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['admin_id'] = this.adminId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['blog_category_id'] = this.blogCategoryId;
    data['image'] = this.image;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['views'] = this.views;
    data['seo_title'] = this.seoTitle;
    data['seo_description'] = this.seoDescription;
    data['status'] = this.status;
    data['show_homepage'] = this.showHomepage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['totalComment'] = this.totalComment;
    return data;
  }
}