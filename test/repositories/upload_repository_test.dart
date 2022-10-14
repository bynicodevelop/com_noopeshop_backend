import "dart:io";

import "package:com_noopeshop_backend/repositories/upload_repository.dart";
import "package:com_noopeshop_backend/utils/generate_name_from_file.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:firebase_storage_mocks/firebase_storage_mocks.dart";
import "package:flutter/services.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  late UploadRepository uploadRepository;

  group("create", () {
    test("Doit permettre d'envoie de media dans le cloud", () async {
      // ARRANGE
      TestWidgetsFlutterBinding.ensureInitialized();

      final FirebaseStorage storage = MockFirebaseStorage();

      uploadRepository = UploadRepository(storage);

      final ByteData localImage =
          await rootBundle.load("assets/datasets/image-test-640x960.jpg");

      File file = await File("data/test.jpg")
          .writeAsBytes(localImage.buffer.asUint8List());

      final String filename = generateNameFromFile(file);

      // ACT
      final Map<String, dynamic> result = await uploadRepository.create({
        "file": file,
      });

      // ASSERT
      expect(
        result["url"].contains(filename),
        true,
      );

      expect(
        result["filename"],
        filename,
      );
    });
  });
}
