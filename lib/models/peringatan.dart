import 'dart:convert';

class Peringatan {
  final int kejadianId;
  final String jamSelesai;
  final int jamSelesaiUnixtime;
  final String kejadianJenis;
  final String kejadianJudul;
  final String kejadianAlamat;
  final String kejadianTindakLanjut;
  final bool kejadianStatus;
  final int lat;
  final int lng;

  Peringatan(
      {this.kejadianId,
      this.jamSelesai,
      this.jamSelesaiUnixtime,
      this.kejadianJenis,
      this.kejadianJudul,
      this.kejadianAlamat,
      this.kejadianTindakLanjut,
      this.kejadianStatus,
      this.lat,
      this.lng});

  factory Peringatan.fromJson(Map<String, dynamic> json) {
    return new Peringatan(
        kejadianId: json['kejadian_id'] as int,
        jamSelesai: json['jam_selesai'] as String,
        jamSelesaiUnixtime: json['jam_selesai_unixtime'] as int,
        kejadianJenis: json['kejadian_jenis'] as String,
        kejadianJudul: json['kejadian_judul'] as String,
        kejadianAlamat: json['kejadian_alamat'] as String,
        kejadianTindakLanjut: json['kejadian_tindak_lanjut'] as String,
        kejadianStatus: json['kejadian_status'] as bool,
        lat: json['lat'] as int,
        lng: json['lng'] as int);
  }

  Map<String, dynamic> toJson() {
    return {
      "kejadianId": kejadianId,
      "jamSelesai": jamSelesai,
      "jamSelesaiUnixtime": jamSelesaiUnixtime,
      "kejadianJenis": kejadianJenis,
      "kejadianJudul": kejadianJudul,
      "kejadianAlamat": kejadianAlamat,
      "kejadianTindakLanjut": kejadianTindakLanjut,
      "kejadianStatus": kejadianStatus,
      "lat": lat,
      "lng": lng
    };
  }

  @override
  String toString() {
    return '{kejadianId: $kejadianId, jamSelesai: $jamSelesai, jamSelesaiUnixtime: $jamSelesaiUnixtime, kejadianJenis: $kejadianJenis, kejadianJudul: $kejadianJudul, kejadianAlamat: $kejadianAlamat, kejadianTindakLanjut: $kejadianTindakLanjut, kejadianStatus: $kejadianStatus, lat: $lat, lng: $lng}';
  }
}

List<Peringatan> peringatanFromJson(String jsonData) {
  // Array object
  final data = json.decode(jsonData)['result'];
  // Non-array object
  // final data = json.decode(jsonData);
  return List<Peringatan>.from(data.map((item) => Peringatan.fromJson(item)));
}

String peringatanToJson(Peringatan data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
