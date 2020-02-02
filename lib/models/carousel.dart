import 'dart:convert';

// class Carousel {
//   final int id;
//   final String label;
//   final String deskripsi;
//   final String gambar;
//   final String status;
//   final String createdBy;
//   final String createdAt;
//   final String updatedBy;
//   final String updatedAt;

//   Carousel._(
//       {this.id,
//       this.label,
//       this.deskripsi,
//       this.gambar,
//       this.status,
//       this.createdBy,
//       this.createdAt,
//       this.updatedBy,
//       this.updatedAt});

//   factory Carousel.fromJson(Map<String, dynamic> json) {
//     return new Carousel._(
//         id: json['id'],
//         label: json['label'],
//         deskripsi: json['deskripsi'],
//         gambar: json['gambar'],
//         status: json['status'],
//         createdBy: json['created_by'],
//         createdAt: json['created_at'],
//         updatedBy: json['updated_by'],
//         updatedAt: json['updated_at']);
//   }
// }

class Carousel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Carousel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Carousel.fromJson(Map<String, dynamic> json) {
    return new Carousel(
        albumId: json['albumId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "albumId": albumId,
      "id": id,
      "title": title,
      "url": url,
      "thumbnailUrl": thumbnailUrl
    };
  }

  @override
  String toString() {
    return '{albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl}';
  }
}

List<Carousel> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Carousel>.from(data.map((item) => Carousel.fromJson(item)));
}

String profileToJson(Carousel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
