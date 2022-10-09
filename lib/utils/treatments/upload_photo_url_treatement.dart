import "dart:io";

import "package:com_noopeshop_backend/repositories/upload_repository.dart";
import "package:com_noopeshop_backend/utils/abstract_treatment.dart";

// ignore: depend_on_referenced_packages
import "package:cross_file/cross_file.dart";

class UploadPhotoUrlTreatement extends AbstractTreatment<List<XFile>, String> {
  late UploadRepository uploadRepository;

  UploadPhotoUrlTreatement(
    this.uploadRepository,
  );

  @override
  Future<String> apply(List<XFile> value) async {
    log(value);

    // TODO: Gérer le cas ou le fichier et vide
    Map<String, dynamic> fileValue = await uploadRepository.create({
      "file": File(value.first.path),
    });

    return fileValue["url"];
  }
}
