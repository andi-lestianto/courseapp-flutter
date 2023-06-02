import 'package:courseapp/app/helper/mainnavigation_helper.dart';
import 'package:courseapp/app/model/apiresponse.dart';
import 'package:courseapp/app/modules/course/model/course_model.dart';
import 'package:courseapp/app/modules/lecturer/model/lecturer_model.dart';
import 'package:courseapp/app/services/dioclient.dart';
import 'package:courseapp/app/widget/toast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CourseController extends GetxController {
  final DioClient dioClient = DioClient();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sksController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();

  List<String> lecturerData = [];
  String? selectedLecturer;

  ApiResponse<List<LecturerModel>> listLecturer = ApiResponse.initial();

  Future<void> getAllLecturer() async {
    listLecturer = ApiResponse.loading();
    final ApiResponse apiResponse = await dioClient.get('dosen');

    if (apiResponse.reqStatus == ReqStatus.done) {
      listLecturer = ApiResponse.done((apiResponse.data as List)
          .map((e) => LecturerModel.fromJson(e))
          .toList());
      for (var i = 0; i < listLecturer.data!.length; i++) {
        lecturerData.add(
            '${listLecturer.data![i].nidn}. ${listLecturer.data![i].nama_dosen}');
      }
      selectedLecturer = lecturerData.first;
      print(selectedLecturer);
    } else if (apiResponse.reqStatus == ReqStatus.error) {
      listLecturer = ApiResponse.initial();
      Toast()
          .showAlert(title: 'Error', message: apiResponse.message.toString());
    }
  }

  updateLecturer(String value) {
    selectedLecturer = value;
    update();
  }

  fillTextField(CourseModel data) {
    idController.text = data.idMatkul.toString();
    nameController.text = data.namaMatkul.toString();
    sksController.text = data.jmlSks.toString();
    semesterController.text = data.semester.toString();
    selectedLecturer = '${data.nidn}. ${data.nama_dosen}';
  }

  clearTextField() {
    idController.clear();
    nameController.clear();
    sksController.clear();
    semesterController.clear();
    selectedLecturer = lecturerData.first;
  }

  ApiResponse<List<CourseModel>> listCourse = ApiResponse.initial();

  Future<void> getAllCourse() async {
    listCourse = ApiResponse.loading();
    update();
    final ApiResponse apiResponse = await dioClient.get('matakuliah');

    if (apiResponse.reqStatus == ReqStatus.done) {
      listCourse = ApiResponse.done((apiResponse.data as List)
          .map((e) => CourseModel.fromJson(e))
          .toList());
    } else if (apiResponse.reqStatus == ReqStatus.error) {
      listCourse = ApiResponse.initial();
      Toast()
          .showAlert(title: 'Error', message: apiResponse.message.toString());
    }
    update();
  }

  Future<void> insertCourse() async {
    if (idController.text == '' ||
        nameController.text == '' ||
        sksController.text == '' ||
        semesterController.text == '') {
      Toast().showAlert(title: 'Gagal', message: 'Semua Data Harus di Isi!');
    } else {
      final ApiResponse apiResponse = await dioClient.post('matakuliah', {
        'id_matkul': idController.text,
        'nama_matkul': nameController.text,
        'jml_sks': sksController.text,
        'semester': semesterController.text,
        'nidn': selectedLecturer!.split('.').first
      });
      if (apiResponse.reqStatus == ReqStatus.done) {
        Toast().showSuccess(
            title: 'Berhasil', message: apiResponse.data['message']);
        getAllCourse();
        MainNavigation.homeNav.currentState!.maybePop();
      } else {
        Toast()
            .showAlert(title: 'Gagal', message: apiResponse.message.toString());
      }
    }
  }

  Future<void> updateCourse(String idmatkul) async {
    if (idController.text == '' ||
        nameController.text == '' ||
        sksController.text == '' ||
        semesterController.text == '') {
      Toast().showAlert(title: 'Gagal', message: 'Semua Data Harus di Isi!');
    } else {
      final ApiResponse apiResponse = await dioClient.put('matakuliah', {
        'nama_matkul': nameController.text,
        'jml_sks': sksController.text,
        'semester': semesterController.text,
        'nidn': selectedLecturer!.split('.').first
      }, {
        'id_matkul': idmatkul
      });
      if (apiResponse.reqStatus == ReqStatus.done) {
        Toast().showSuccess(
            title: 'Berhasil', message: apiResponse.data['message']);
        getAllCourse();
        MainNavigation.homeNav.currentState!.maybePop();
      } else {
        Toast()
            .showAlert(title: 'Gagal', message: apiResponse.message.toString());
      }
    }
  }

  Future<void> deleteCourse(String idmatkul) async {
    final ApiResponse apiResponse =
        await dioClient.delete('matakuliah', {'id_matkul': idmatkul});
    if (apiResponse.reqStatus == ReqStatus.done) {
      Toast()
          .showSuccess(title: 'Berhasil', message: apiResponse.data['message']);

      MainNavigation.homeNav.currentState!.maybePop();
    } else {
      Toast()
          .showAlert(title: 'Gagal', message: apiResponse.message.toString());
    }
    getAllCourse();
  }

  List<CourseModel> filteredCourse = [];

  searchCourse() {
    if (listCourse.data != null) {
      filteredCourse = listCourse.data!
          .where((element) => element.namaMatkul!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    getAllCourse();
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
