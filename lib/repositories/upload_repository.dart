import "dart:io";

import "package:com_noopeshop_backend/utils/generate_name_from_file.dart";
import "package:firebase_storage/firebase_storage.dart";

class UploadRepository {
  late FirebaseStorage firebaseStorage;

  UploadRepository(
    this.firebaseStorage,
  );

  Future<void> get() async {}

  Future<void> list() async {}

  Future<Map<String, dynamic>> create(Map<String, dynamic> data) async {
    final File file = data["file"];

    final String filename = generateNameFromFile(file);

    final String fileName = file.path.split("/").last;

    TaskSnapshot task =
        await firebaseStorage.ref("images/$fileName").putFile(file);

    final String url = await task.ref.getDownloadURL();

    return {
      "url": url,
      "filename": filename,
    };
  }

  Future<void> update(Map<String, dynamic> data) async {}

  Future<void> createOrUpdate(Map<String, dynamic> data) async {}

  Future<void> delete(Map<String, dynamic> data) async {}
}
