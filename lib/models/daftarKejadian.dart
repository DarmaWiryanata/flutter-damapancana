import 'dart:convert';

class DaftarKejadian {
  final int id;
  final String title;
  final String slug;
  final String img;
  final String createdAt;
  final String deletedAt;

  DaftarKejadian(
      {this.id,
      this.title,
      this.slug,
      this.img,
      this.createdAt,
      this.deletedAt});

  factory DaftarKejadian.fromJson(Map<String, dynamic> json) {
    return new DaftarKejadian(
        id: json['id'] as int,
        title: json['title'] as String,
        slug: json['slug'] as String,
        img: json['img'] as String,
        createdAt: json['created_at'] as String,
        deletedAt: json['deleted_at'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "slug": slug,
      "img": img,
      "created_at": createdAt,
      "deleted_at": deletedAt,
    };
  }

  @override
  String toString() {
    return '{id: $id, title: $title, slug: $slug, img: $img, createdAt: $createdAt, deletedAt: $deletedAt}';
  }
}

List<DaftarKejadian> profileFromJson(String jsonData) {
  // Array object
  final data = json.decode(jsonData)['data'];
  // Non-array object
  // final data = json.decode(jsonData);
  return List<DaftarKejadian>.from(
      data.map((item) => DaftarKejadian.fromJson(item)));
}

String profileToJson(DaftarKejadian data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
