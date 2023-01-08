class Biodata {
  String id;
  String nama;
  String kelas;

  Biodata({required this.id, required this.nama, required this.kelas});

  factory Biodata.fromJson(Map<String, dynamic> biodata) => Biodata(
      id: biodata['id'], nama: biodata['nama'], kelas: biodata['kelas']);
}
