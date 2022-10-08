import "package:cloud_functions/cloud_functions.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";

class CommonRepository {
  late FirebaseFunctions firebaseFunctions;

  CommonRepository(
    this.firebaseFunctions,
  );

  Future<void> get() async {}

  Future<Map<String, dynamic>> list(Map<String, dynamic> data) async {
    if (data["collection"] == null || data["collection"] == "") {
      throw StandardException(
        code: "missing_parameters",
        message: "Missing parameters",
      );
    }

    final HttpsCallable httpsCallable = firebaseFunctions.httpsCallable(
      "listCommon",
    );

    final HttpsCallableResult httpsCallableResult = await httpsCallable.call({
      "collection": data["collection"],
    });

    return Map<String, dynamic>.from(httpsCallableResult.data);
  }

  Future<void> create(Map<String, dynamic> data) async {}

  Future<void> update(Map<String, dynamic> data) async {}

  Future<void> createOrUpdate(Map<String, dynamic> data) async {}

  Future<void> delete(Map<String, dynamic> data) async {
    if (data["uid"] == null || data["uid"] == "") {
      throw StandardException(
        code: "missing_parameters",
        message: "uid is missing",
      );
    }

    if (data["collection"] == null || data["collection"] == "") {
      throw StandardException(
        code: "missing_parameters",
        message: "collection is missing",
      );
    }

    final HttpsCallable httpsCallable = firebaseFunctions.httpsCallable(
      "deleteCommon",
    );

    HttpsCallableResult result = await httpsCallable.call(data);

    if (result.data["result"] == "error") {
      throw StandardException(
        code: result.data["reason"],
        message: result.data["result"],
      );
    }
  }
}
