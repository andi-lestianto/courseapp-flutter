import 'package:courseapp/app/helper/mainnavigation_helper.dart';
import 'package:courseapp/app/helper/randomimgurl_helper.dart';
import 'package:courseapp/app/model/apiresponse.dart';
import 'package:courseapp/app/modules/lecturer/model/lecturer_model.dart';
import 'package:courseapp/app/services/dioclient.dart';
import 'package:courseapp/app/widget/toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LecturerController extends GetxController {
  final DioClient dioClient = DioClient();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController nidnController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();

  String selectedJenkel = 'Laki - Laki';

  updateJenkel(String value) {
    selectedJenkel = value;
    update();
  }

  fillTextField(LecturerModel data) {
    nidnController.text = data.nidn.toString();
    nameController.text = data.nama_dosen.toString();
    alamatController.text = data.alamat.toString();
    tanggalController.text = data.tglLahir.toString();
    if (data.jnsKelamin == 'L') {
      selectedJenkel = 'Laki - Laki';
    } else {
      selectedJenkel = 'Perempuan';
    }
  }

  clearTextField() {
    nidnController.clear();
    nameController.clear();
    alamatController.clear();
    tanggalController.clear();
    selectedJenkel = 'Laki - Laki';
  }

  ApiResponse<List<LecturerModel>> listLecturer = ApiResponse.initial();

  Future<void> getAllLecturer() async {
    listLecturer = ApiResponse.loading();
    update();
    final ApiResponse apiResponse = await dioClient.get('dosen');

    if (apiResponse.reqStatus == ReqStatus.done) {
      listLecturer = ApiResponse.done((apiResponse.data as List)
          .map((e) => LecturerModel.fromJson(e))
          .toList());
    } else if (apiResponse.reqStatus == ReqStatus.error) {
      listLecturer = ApiResponse.initial();
      Toast()
          .showAlert(title: 'Error', message: apiResponse.message.toString());
    }
    update();
  }

  Future<void> insertLecturer() async {
    if (nidnController.text == '' ||
        nameController.text == '' ||
        alamatController.text == '' ||
        tanggalController.text == '' ||
        selectedJenkel == '') {
      Toast().showAlert(title: 'Gagal', message: 'Semua Data Harus di Isi!');
    } else {
      final ApiResponse apiResponse = await dioClient.post('dosen', {
        'nidn': nidnController.text,
        'nama_dosen': nameController.text,
        'alamat': alamatController.text,
        'tgl_lahir': tanggalController.text,
        'jns_kelamin': selectedJenkel.substring(0, 1),
        'pict': RandomImage().getImageUrl()
      });
      if (apiResponse.reqStatus == ReqStatus.done) {
        Toast().showSuccess(
            title: 'Berhasil', message: apiResponse.data['message']);
        getAllLecturer();
        MainNavigation.homeNav.currentState!.maybePop();
      } else {
        Toast()
            .showAlert(title: 'Gagal', message: apiResponse.message.toString());
      }
    }
  }

  Future<void> updateLecturer() async {
    if (nidnController.text == '' ||
        nameController.text == '' ||
        alamatController.text == '' ||
        tanggalController.text == '' ||
        selectedJenkel == '') {
      Toast().showAlert(title: 'Gagal', message: 'Semua Data Harus di Isi!');
    } else {
      final ApiResponse apiResponse = await dioClient.put('dosen', {
        'nama_dosen': nameController.text,
        'alamat': alamatController.text,
        'tgl_lahir': tanggalController.text,
        'jns_kelamin': selectedJenkel.substring(0, 1)
      }, {
        'nidn': nidnController.text
      });
      if (apiResponse.reqStatus == ReqStatus.done) {
        Toast().showSuccess(
            title: 'Berhasil', message: apiResponse.data['message']);
        getAllLecturer();
        MainNavigation.homeNav.currentState!.maybePop();
      } else {
        Toast()
            .showAlert(title: 'Gagal', message: apiResponse.message.toString());
      }
    }
  }

  Future<void> deleteLecturer(String nidn) async {
    final ApiResponse apiResponse =
        await dioClient.delete('dosen', {'nidn': nidn});
    if (apiResponse.reqStatus == ReqStatus.done) {
      Toast()
          .showSuccess(title: 'Berhasil', message: apiResponse.data['message']);

      MainNavigation.homeNav.currentState!.maybePop();
    } else {
      Toast()
          .showAlert(title: 'Gagal', message: apiResponse.message.toString());
    }
    getAllLecturer();
  }

  List<LecturerModel> filteredLecturer = [];

  searchLecturer() {
    if (listLecturer.data != null) {
      filteredLecturer = listLecturer.data!
          .where((element) => element.nama_dosen!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    getAllLecturer();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
