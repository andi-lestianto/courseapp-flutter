class LecturerModel {
  int? nidn;
  String? namaDosen;
  String? alamat;
  String? tglLahir;
  String? jnsKelamin;

  LecturerModel(
      {this.nidn, this.namaDosen, this.alamat, this.tglLahir, this.jnsKelamin});

  LecturerModel.fromJson(Map<String, dynamic> json) {
    nidn = json['nidn'];
    namaDosen = json['nama_dosen'];
    alamat = json['alamat'];
    tglLahir = json['tgl_lahir'];
    jnsKelamin = json['jns_kelamin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nidn'] = this.nidn;
    data['nama_dosen'] = this.namaDosen;
    data['alamat'] = this.alamat;
    data['tgl_lahir'] = this.tglLahir;
    data['jns_kelamin'] = this.jnsKelamin;
    return data;
  }
}
