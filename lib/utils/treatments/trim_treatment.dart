import "package:com_noopeshop_backend/utils/abstract_treatment.dart";

class TrimTreatment extends AbstractTreatment<String, String> {
  @override
  Future<String> apply(String value) async {
    log(value);

    return value.trim();
  }
}
