class Narapidana {
  String id;
  String nama;
  String jenisKelamin;
  String umur;
  String kasus;

  Narapidana({
    required this.id,
    required this.nama,
    required this.jenisKelamin,
    required this.umur,
    required this.kasus,
  });

  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'jenis_kelamin': jenisKelamin,
      'umur': umur,
      'kasus': kasus,
    };
  }
}