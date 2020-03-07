import 'dart:convert';

class Telepon {
  final String namaTelp;
  final String nomorTelp;
  final String alamatTelp;

  Telepon({
    this.namaTelp,
    this.nomorTelp,
    this.alamatTelp
  });

  factory Telepon.fromJson(Map<String, dynamic> json) {
    return new Telepon(
        namaTelp: json['nama_telp'] as String,
        nomorTelp: json['nomor_telp'] as String,
        alamatTelp: json['alamat_telp'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "alamatTelp": namaTelp,
      "nomorTelp": nomorTelp,
      "alamatTelp": alamatTelp
    };
  }

  @override
  String toString() {
    return '{alamatTelp: $alamatTelp, nomorTelp: $nomorTelp, alamatTelp: $alamatTelp}';
  }
}

List<Telepon> teleponFromJson(String jsonData) {
  // Array object
  final data = json.decode(jsonData)['result'];
  // Non-array object
  // final data = json.decode(jsonData);
  return List<Telepon>.from(data.map((item) => Telepon.fromJson(item)));
}

String profileToJson(Telepon data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
