class Alamat {
  final String jalan;
  final String kota;
  final String provinsi;

  Alamat({
    required this.jalan,
    required this.kota,
    required this.provinsi,
  });

  factory Alamat.fromJson(Map<String, dynamic> json) {
    return Alamat(
      jalan: json['jalan'] as String,
      kota: json['kota'] as String,
      provinsi: json['provinsi'] as String,
    );
  }

  @override
  String toString() => '$jalan, $kota, $provinsi';
}

class Karyawan {
  final String nama;
  final int umur;
  final Alamat alamat;
  final List<String> hobi;

  Karyawan({
    required this.nama,
    required this.umur,
    required this.alamat,
    required this.hobi,
  });

  factory Karyawan.fromJson(Map<String, dynamic> json) {
    return Karyawan(
      nama: json['nama'] as String,
      umur: json['umur'] as int,
      alamat: Alamat.fromJson(json['alamat'] as Map<String, dynamic>),
      hobi: List<String>.from(json['hobi'] as List),
    );
  }
}
