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
  final int id;
  final String label;
  final String deskripsi;
  final String gambar;
  final String status;
  final String createdBy;
  final String createdAt;
  final String updatedBy;
  final String updatedAt;

  Carousel({
    this.id,
    this.label,
    this.deskripsi,
    this.gambar,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt
  });

  factory Carousel.fromJson(Map<String, dynamic> json) {
    return new Carousel(
        id: json['id'] as int,
        label: json['label'] as String,
        deskripsi: json['deskripsi'] as String,
        gambar: json['gambar'] as String,
        status: json['status'] as String,
        createdBy: json['created_by'] as String,
        createdAt: json['created_at'] as String,
        updatedBy: json['updated_by'] as String,
        updatedAt: json['updated_at'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "label": label,
      "deskripsi": deskripsi,
      "gambar": gambar,
      "status": status,
      "createdBy": createdBy,
      "createdAt": createdAt,
      "updatedBy": updatedBy,
      "updatedAt": updatedAt,
    };
  }

  @override
  String toString() {
    return '{id: $id, label: $label, deskripsi: $deskripsi, gambar: $gambar, status: $status, createdBy: $createdBy, createdAt: $createdAt, updatedBy: $updatedBy, updatedAt: $updatedAt}';
  }
}

List<Carousel> profileFromJson(String jsonData) {
  // Array object
  final data = json.decode(jsonData)['result'];
  // Non-array object
  // final data = json.decode(jsonData);
  return List<Carousel>.from(data.map((item) => Carousel.fromJson(item)));
}

String profileToJson(Carousel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
