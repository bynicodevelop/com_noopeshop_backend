// ignore: depend_on_referenced_packages
import "dart:io";

import "package:com_noopeshop_backend/repositories/upload_repository.dart";
import "package:com_noopeshop_backend/utils/abstract_treatment.dart";
// ignore: depend_on_referenced_packages
import "package:cross_file/cross_file.dart";

class UploadTreatment
    extends AbstractTreatment<List<XFile>, List<Map<String, dynamic>>> {
  late UploadRepository uploadRepository;

  UploadTreatment(
    this.uploadRepository,
  );

  @override
  Future<List<Map<String, dynamic>>> apply(List<XFile> value) async {
    log(value);

    return await Future.wait(
      value.map(
        (XFile file) async => await uploadRepository.create({
          "file": File(file.path),
        }),
      ),
    );
  }
}
