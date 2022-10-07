import "package:cloud_functions/cloud_functions.dart";
import "package:injectable/injectable.dart";

@Injectable()
class UserRepository {
  late FirebaseFunctions firebaseFunctions;

  UserRepository(
    this.firebaseFunctions,
  );

  Future<void> get() async {}

  Future<void> list() async {}

  Future<void> create(
    Map<String, dynamic> data,
  ) async {
    final HttpsCallable callable = firebaseFunctions.httpsCallable(
      "createUser",
    );

    await callable.call(
      data,
    );
  }

  Future<void> update(Map<String, dynamic> data) async {}

  Future<void> createOrUpdate(Map<String, dynamic> data) async {}

  Future<void> delete(Map<String, dynamic> data) async {}
}
