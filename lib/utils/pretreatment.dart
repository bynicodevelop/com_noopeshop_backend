import "package:com_noopeshop_backend/config/dependency_config.dart";
import "package:com_noopeshop_backend/utils/treatments/toloawercase_treatment.dart";
import "package:com_noopeshop_backend/utils/treatments/trim_treatment.dart";
import "package:com_noopeshop_backend/utils/treatments/upload_photo_url_treatement.dart";
import "package:com_noopeshop_backend/utils/treatments/upload_treatment.dart";
import "package:com_noopeshop_backend/repositories/upload_repository.dart";

class PreTreatment {
  dynamic get(String treatment) {
    switch (treatment) {
      case "trim":
        return TrimTreatment();
      case "toLowerCase":
        return ToLowerCaseTreatment();
      case "upload":
        return UploadTreatment(
          getIt<UploadRepository>(),
        );
      case "uploadPhotoUrl":
        return UploadPhotoUrlTreatement(
          getIt<UploadRepository>(),
        );
    }
  }
}
