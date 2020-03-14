import 'dart:convert';

class DaftarKejadian {
  final int idKejadian;
  final String judulKejadian;
  final String tanggalKejadian;

  DaftarKejadian({this.idKejadian, this.judulKejadian, this.tanggalKejadian});

  factory DaftarKejadian.fromJson(Map<String, dynamic> json) {
    return new DaftarKejadian(
        idKejadian: json['id_kejadian'] as int,
        judulKejadian: json['judul_kejadian'] as String,
        tanggalKejadian: json['tanggal_kejadian'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "idKejadian": idKejadian,
      "judulKejadian": judulKejadian,
      "tanggalKejadian": tanggalKejadian,
    };
  }

  @override
  String toString() {
    return '{idKejadian: $idKejadian, judulKejadian: $judulKejadian, tanggalKejadian: $tanggalKejadian}';
  }
}

// class DaftarKejadian {
//   final int idKejadian;
//   final String jenisKejadian;
//   final String judulKejadian;
//   final String pelapor;
//   final String tkp;
//   final String tanggalKejadian;
//   final String waktuKejadian;
//   final String keteranganKejadian;
//   final String statusKejadian;

//   DaftarKejadian(
//       {this.idKejadian,
//       this.jenisKejadian,
//       this.judulKejadian,
//       this.pelapor,
//       this.tkp,
//       this.tanggalKejadian,
//       this.waktuKejadian,
//       this.keteranganKejadian,
//       this.statusKejadian});

//   factory DaftarKejadian.fromJson(Map<String, dynamic> json) {
//     return new DaftarKejadian(
//         idKejadian: json['id_kejadian'] as int,
//         jenisKejadian: json['jenis_kejadian'] as String,
//         judulKejadian: json['judul_kejadian'] as String,
//         pelapor: json['pelapor'] as String,
//         tkp: json['tkp'] as String,
//         tanggalKejadian: json['tanggal_kejadian'] as String,
//         waktuKejadian: json['waktu_kejadian'] as String,
//         keteranganKejadian: json['keterangan_kejadian'] as String,
//         statusKejadian: json['status_kejadian'] as String);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "idKejadian": idKejadian,
//       "jenisKejadian": jenisKejadian,
//       "judulKejadian": judulKejadian,
//       "pelapor": pelapor,
//       "tkp": tkp,
//       "tanggalKejadian": tanggalKejadian,
//       "waktuKejadian": waktuKejadian,
//       "keteranganKejadian": keteranganKejadian,
//       "statusKejadian": statusKejadian,
//     };
//   }

//   @override
//   String toString() {
//     return '{idKejadian: $idKejadian, jenisKejadian: $jenisKejadian, judulKejadian: $judulKejadian, pelapor: $pelapor, tkp: $tkp, tanggalKejadian: $tanggalKejadian, waktuKejadian: $waktuKejadian, keteranganKejadian: $keteranganKejadian, statusKejadian: $statusKejadian}';
//   }
// }

List<DaftarKejadian> kejadianFromJson(String jsonData) {
  // Array object
  final data = json.decode(jsonData)['result'];
  // Non-array object
  // final data = json.decode(jsonData);
  return List<DaftarKejadian>.from(
      data.map((item) => DaftarKejadian.fromJson(item)));
}

String profileToJson(DaftarKejadian data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
