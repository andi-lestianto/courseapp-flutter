class LecturerModel {
  int? nidn;
  String? nama_dosen;
  String? alamat;
  String? tglLahir;
  String? jnsKelamin;
  String? pict;

  LecturerModel(
      {this.nidn,
      this.nama_dosen,
      this.alamat,
      this.tglLahir,
      this.jnsKelamin,
      this.pict});

  LecturerModel.fromJson(Map<String, dynamic> json) {
    nidn = json['nidn'];
    nama_dosen = json['nama_dosen'];
    alamat = json['alamat'];
    tglLahir = json['tgl_lahir'];
    jnsKelamin = json['jns_kelamin'];
    pict = json['pict'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nidn'] = this.nidn;
    data['nama_dosen'] = this.nama_dosen;
    data['alamat'] = this.alamat;
    data['tgl_lahir'] = this.tglLahir;
    data['jns_kelamin'] = this.jnsKelamin;
    data['pict'] = this.pict;

    return data;
  }
}
