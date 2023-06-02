class CourseModel {
  String? idMatkul;
  String? namaMatkul;
  int? jmlSks;
  int? semester;
  int? nidn;
  String? nama_dosen;

  CourseModel(
      {this.idMatkul,
      this.namaMatkul,
      this.jmlSks,
      this.semester,
      this.nidn,
      this.nama_dosen});

  CourseModel.fromJson(Map<String, dynamic> json) {
    idMatkul = json['id_matkul'];
    namaMatkul = json['nama_matkul'];
    jmlSks = json['jml_sks'];
    semester = json['semester'];
    nidn = json['nidn'];
    nama_dosen = json['nama_dosen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_matkul'] = this.idMatkul;
    data['nama_matkul'] = this.namaMatkul;
    data['jml_sks'] = this.jmlSks;
    data['semester'] = this.semester;
    data['nidn'] = this.nidn;
    data['nama_dosen'] = this.nama_dosen;
    return data;
  }
}
