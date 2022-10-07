import "dart:io";

import "package:com_noopeshop_backend/utils/generate_name_from_file.dart";
import "package:flutter/services.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test("Doit permettre de créer un nom md5 à partir d'un fichier", () async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // ARRANGE
    final ByteData localImage =
        await rootBundle.load("assets/datasets/image-test-640x960.jpg");

    File file = await File("data/test.jpg")
        .writeAsBytes(localImage.buffer.asUint8List());

    // ACT
    final String result = generateNameFromFile(file);

    // ASSERT
    expect(result, "54a9af5b23be97b2a99b92b291fc840e.jpg");
  });
}
