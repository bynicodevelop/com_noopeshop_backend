import "package:com_noopeshop_backend/utils/logger.dart";

abstract class AbstractTreatment<T, Y> {
  void log(
    dynamic value, {
    String function = "apply",
  }) {
    info("$runtimeType.$function", data: {
      "value": value,
    });
  }

  Future<Y> apply(T value);
}
